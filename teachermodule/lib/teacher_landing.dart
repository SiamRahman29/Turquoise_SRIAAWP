import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeacherModule(),
      debugShowCheckedModeBanner: false
    );
  }
}


class TeacherModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Module'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/school_logo.png', width: 100, height: 100),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Monthly Self-Evaluation screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MonthlyEvaluationScreenWithSelection(),
                  ),
                );
              },
              child: Text('Keberhasilan Bulanan / Monthly Self-Evaluation'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Yearly Evaluation screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YearlyEvaluationScreenWithSelection(),
                  ),
                );
              },
              child: Text('Keberhasilan Tahunan / Yearly Evaluation'),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyEvaluationScreenWithSelection extends StatefulWidget {
  @override
  _MonthlyEvaluationScreenWithSelectionState createState() =>
      _MonthlyEvaluationScreenWithSelectionState();
}

class _MonthlyEvaluationScreenWithSelectionState
    extends State<MonthlyEvaluationScreenWithSelection> {
  String? selectedYear;
  String? selectedMonth;
  List<String> years = ['2022', '2023', '2024', '2025'];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    selectedYear = years[0]; // Default year
    selectedMonth = months[0]; // Default month
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Self-Evaluation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('PILIH YANG BERKENAAN'),
            Text('CHOOSE THE RELATED'),
            SizedBox(height: 50),
            Text('Tahun/Year:'),
            DropdownButton<String>(
              value: selectedYear,
              items: years.map((year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (String? year) {
                setState(() {
                  selectedYear = year;
                });
              },
            ),
            SizedBox(height: 30),
            Text('Bulan/Month:'),
            DropdownButton<String>(
              value: selectedMonth,
              items: months.map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
              onChanged: (String? month) {
                setState(() {
                  selectedMonth = month;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the selected year and month, e.g., submit the evaluation
                print('Selected Year: $selectedYear, Selected Month: $selectedMonth');

                // Navigate to the AfterSelectionPage and pass the selected option
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterSelectionPage(
                      selectedOption: 'Monthly Evaluation for $selectedMonth $selectedYear',
                    ),
                  ),
                );
              },
              child: Text('Hantar / Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class YearlyEvaluationScreenWithSelection extends StatefulWidget {
  @override
  _YearlyEvaluationScreenWithSelectionState createState() =>
      _YearlyEvaluationScreenWithSelectionState();
}

class _YearlyEvaluationScreenWithSelectionState extends State<YearlyEvaluationScreenWithSelection> {
  String? selectedYear;
  List<String> years = ['2022', '2023', '2024', '2025'];

  @override
  void initState() {
    super.initState();
    selectedYear = years[0]; // Default year
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keberhasilan Tahunan / Yearly Evaluation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('PILIH YANG BERKENAAN'),
            Text('CHOOSE THE RELATED'),
            SizedBox(height: 50),
            Text('Tahun/Year:'),
            DropdownButton<String>(
              value: selectedYear,
              items: years.map((year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (String? year) {
                setState(() {
                  selectedYear = year;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the AfterSelectionPage and pass the selected option
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterSelectionPage(
                      selectedOption: 'Yearly Evaluation for $selectedYear',
                    ),
                  ),
                );
              },
              child: Text('Hantar / Submit'),
            )
          ],
        ),
      ),
    );
  }
}


class AfterSelectionPage extends StatelessWidget {
  final String selectedOption;

  // Constructor
  AfterSelectionPage({required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('After Selection Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You selected:'),
            Text(
              selectedOption,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Choose Your Role'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the management evaluation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagementEvaluationPage(),
                  ),
                );
              },
              child: Text('Management'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the teacher form evaluation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeacherEvaluationFormPage(teacherName: 'SelectedTeacher'),
                  ),
                );
              },
              child: Text('Teacher'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous page (TeacherModule)
                Navigator.pop(context);
              },
              child: Text('Back to Teacher Module'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManagementEvaluationPage extends StatefulWidget {
  @override
  _ManagementEvaluationPageState createState() =>
      _ManagementEvaluationPageState();
}

class _ManagementEvaluationPageState
    extends State<ManagementEvaluationPage> {
  List<String> teachers = ['Teacher A', 'Teacher B', 'Teacher C'];
  String? selectedTeacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management Evaluation Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Choose the teacher related:'),
            SizedBox(height: 20),
            Text('Select Teacher:'),
            DropdownButton<String>(
              value: selectedTeacher,
              items: teachers.map((teacher) {
                return DropdownMenuItem<String>(
                  value: teacher,
                  child: Text(teacher),
                );
              }).toList(),
              onChanged: (String? teacher) {
                // Handle the selected teacher
                print('Selected Teacher: $teacher');
                // You can perform actions based on the selected teacher
                setState(() {
                  selectedTeacher = teacher;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedTeacher != null) {
                  // Navigate to the next page with the selected teacher's evaluation form
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeacherEvaluationFormPage(teacherName: selectedTeacher!),
                    ),
                  );
                } else {
                  // Show an alert or some indication that a teacher must be selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select a teacher before submitting.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherEvaluationFormPage extends StatelessWidget {
  final String teacherName;

  // Constructor
  TeacherEvaluationFormPage({required this.teacherName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Evaluation Form'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Evaluation Form for $teacherName'),
            // Add your evaluation form widgets here
          ],
        ),
      ),
    );
  }
}
