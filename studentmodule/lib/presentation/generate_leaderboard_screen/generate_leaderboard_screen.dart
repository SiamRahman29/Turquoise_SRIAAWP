import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentmodule3/core/app_export.dart';

class GenerateLeaderboardScreen extends StatelessWidget {
  const GenerateLeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                //_buildHomeRow(context),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle52,
                  height: 43.v,
                  width: 430.h,
                ),
                SizedBox(height: 27.v),
                Text("Generated Leaderboard", style: theme.textTheme.headlineLarge),
                SizedBox(height: 48.v),
                Container(
                  width: 256.h,
                  margin: EdgeInsets.only(bottom: 312.v),
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance.collection('Turquoise').doc('Students').collection('PersonalInfo').get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      List<DocumentSnapshot> docs = snapshot.data!.docs;
                      
                      // Sort in descending order based on TotalPoints
                      docs.sort((a, b) => b['TotalPoints'].compareTo(a['TotalPoints']));

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return _buildLeaderboardEntry(
                            docs[index]['Name'],
                            docs[index]['TotalPoints'],
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 72.v),
                SizedBox(height: 72.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 30.v,
                    width: 105.h,
                    margin: EdgeInsets.only(right: 24.h),
                    child: Stack(alignment: Alignment.center, children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: GestureDetector(
                          onTap: () {
                            onTapView(context);
                          },
                          child: Container(
                            height: 27.v,
                            width: 105.h,
                            decoration: BoxDecoration(
                              color: appTheme.blueGray100,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text("Back", style: theme.textTheme.headlineSmall),
                      )
                    ]),
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        //bottomNavigationBar: _buildStackTwo(context),
      ),
    );
  }

  // Your existing methods here

  Widget _buildLeaderboardEntry(String playerName, int points) {
    return Text("$playerName - $points");
  }
  

  void onTapImgHomeThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landingScreen);
  }

  void onTapImgDefaultPfpTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teacherInfoScreen);
  }

  void onTapView(BuildContext context) {
    Navigator.pop(context); // This will go back to the previous screen
  }
}
