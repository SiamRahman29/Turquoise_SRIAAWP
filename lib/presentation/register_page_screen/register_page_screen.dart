import 'package:flutter/material.dart';
import 'package:first/core/app_export.dart';
import 'package:first/widgets/custom_elevated_button.dart';
import 'package:first/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPageScreen extends StatelessWidget {
  RegisterPageScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    _buildWelcomeText(context),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle5,
                      height: 43.v,
                      width: 430.h,
                    ),
                    SizedBox(height: 57.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgSriaawp1,
                      height: 178.v,
                      width: 177.h,
                    ),
                    SizedBox(height: 60.v),
                    Text(
                      "Turquoise",
                      style: theme.textTheme.displaySmall,
                    ),
                    SizedBox(height: 62.v),
                    CustomTextFormField(
                      width: 300.h,
                      controller: emailController,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textInputType: TextInputType.emailAddress,
                      textStyle: TextStyle(
                        color: Colors.black, // Set the color to white or your desired color
                      )
                    ),
                    CustomTextFormField(
                      width: 300.h,
                      controller: passwordController,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      textStyle: TextStyle(
                        color: Colors.black, // Set the color to white or your desired color
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 62.v),
                    CustomElevatedButton(
                      width: 105.h,
                      text: "Login",
                      buttonTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      
                      onPressed: () {
                        signInWithEmailAndPassword(context);
                      },
                      
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      if (_formKey.currentState?.validate() ?? false) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());

        // Successfully signed in, you can now navigate to another screen or perform other actions.
        print('Signed in: ${userCredential.user?.email}');
        onTapView(context);
      }
    } catch (e) {
      // Handle sign-in errors
      print('Error signing in: $e');
    }
  }

  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageScreen);
  }

  /// Section Widget
  Widget _buildWelcomeText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 121.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillTeal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 15.v),
          Text(
            "Welcome ",
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
