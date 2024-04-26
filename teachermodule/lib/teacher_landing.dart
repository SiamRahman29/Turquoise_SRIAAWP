import 'package:flutter/material.dart';
import 'ManagementMonthlyForm.dart' as ManagementMonthlyForm;
import 'ManagementYearlyForm.dart' as ManagementYearlyForm;
import 'TeacherMonthlyForm.dart' as TeacherMonthlyForm;
import 'TeacherYearlyForm.dart' as TeacherYearlyForm;

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: TeacherModule(), debugShowCheckedModeBanner: false);
  }
}

class TeacherModule extends StatelessWidget {
  const TeacherModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Module'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/school_logo.png', width: 100, height: 100),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Monthly Self-Evaluation screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MonthlyEvaluationScreenWithSelection(),
                  ),
                );
              },
              child: const Text('Keberhasilan Bulanan / Monthly Self-Evaluation'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Yearly Evaluation screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YearlyEvaluationScreenWithSelection(),
                  ),
                );
              },
              child: const Text('Keberhasilan Tahunan / Yearly Evaluation'),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyEvaluationScreenWithSelection extends StatefulWidget {
  const MonthlyEvaluationScreenWithSelection({super.key});

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
        title: const Text('Monthly Self-Evaluation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('PILIH YANG BERKENAAN'),
            const Text('CHOOSE THE RELATED'),
            const SizedBox(height: 50),
            const Text('Tahun/Year:'),
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
            const SizedBox(height: 30),
            const Text('Bulan/Month:'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the selected year and month, e.g., submit the evaluation
                print(
                    'Selected Year: $selectedYear, Selected Month: $selectedMonth');

                // Navigate to the AfterSelectionPage and pass the selected option
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterSelectionPageMonth(
                      selectedOption:
                          'Monthly Evaluation for $selectedMonth $selectedYear',
                    ),
                  ),
                );
              },
              child: const Text('Hantar / Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class YearlyEvaluationScreenWithSelection extends StatefulWidget {
  const YearlyEvaluationScreenWithSelection({super.key});

  @override
  _YearlyEvaluationScreenWithSelectionState createState() =>
      _YearlyEvaluationScreenWithSelectionState();
}

class _YearlyEvaluationScreenWithSelectionState
    extends State<YearlyEvaluationScreenWithSelection> {
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
        title: const Text('Keberhasilan Tahunan / Yearly Evaluation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('PILIH YANG BERKENAAN'),
            const Text('CHOOSE THE RELATED'),
            const SizedBox(height: 50),
            const Text('Tahun/Year:'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the AfterSelectionPage and pass the selected option
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterSelectionPageYear(
                      selectedOption: 'Yearly Evaluation for $selectedYear',
                    ),
                  ),
                );
              },
              child: const Text('Hantar / Submit'),
            )
          ],
        ),
      ),
    );
  }
}

class AfterSelectionPageMonth extends StatelessWidget {
  final String selectedOption;

  // Constructor
  const AfterSelectionPageMonth({super.key, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('After Selection Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You selected:'),
            Text(
              selectedOption,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Choose Your Role'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the management evaluation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManagementEvaluationMonthlyPage(),
                  ),
                );
              },
              child: const Text('Management'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the teacher form evaluation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeacherMonthlyForm.MyApp(),
                  ),
                );
              },
              child: const Text('Teacher'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous page (TeacherModule)
                Navigator.pop(context);
              },
              child: const Text('Back to Teacher Module'),
            ),
          ],
        ),
      ),
    );
  }
}

class AfterSelectionPageYear extends StatelessWidget {
  final String selectedOption;

  // Constructor
  const AfterSelectionPageYear({super.key, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('After Selection Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You selected:'),
            Text(
              selectedOption,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Choose Your Role'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the management evaluation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManagementEvaluationYearlyPage(),
                  ),
                );
              },
              child: const Text('Management'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the teacher form evaluation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeacherYearlyForm.MyApp(),
                  ),
                );
              },
              child: const Text('Teacher'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous page (TeacherModule)
                Navigator.pop(context);
              },
              child: const Text('Back to Teacher Module'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManagementEvaluationYearlyPage extends StatefulWidget {
  const ManagementEvaluationYearlyPage({super.key});

  @override
  _ManagementEvaluationPageState createState() =>
      _ManagementEvaluationPageState();
}

class _ManagementEvaluationYearlyPageState extends State<ManagementEvaluationYearlyPage> {
  List<String> teachers = ['Teacher A', 'Teacher B', 'Teacher C'];
  String? selectedTeacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management Evaluation Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Choose the teacher related:'),
            const SizedBox(height: 20),
            const Text('Select Teacher:'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedTeacher != null) {
                  // Navigate to the next page with the selected teacher's evaluation form
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ManagementYearlyForm.MyApp(),
                    ),
                  );
                } else {
                  // Show an alert or some indication that a teacher must be selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content:
                            const Text('Please select a teacher before submitting.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManagementEvaluationMonthlyPage extends StatefulWidget {
  const ManagementEvaluationMonthlyPage({super.key});

  @override
  _ManagementEvaluationPageState createState() =>
      _ManagementEvaluationPageState();
}

class _ManagementEvaluationPageState extends State<ManagementEvaluationMonthlyPage> {
  List<String> teachers = ['Teacher A', 'Teacher B', 'Teacher C'];
  String? selectedTeacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management Evaluation Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Choose the teacher related:'),
            const SizedBox(height: 20),
            const Text('Select Teacher:'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedTeacher != null) {
                  // Navigate to the next page with the selected teacher's evaluation form
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ManagementMonthlyForm.MyApp(),
                    ),
                  );
                } else {
                  // Show an alert or some indication that a teacher must be selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content:
                            const Text('Please select a teacher before submitting.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Submit'),
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
  const TeacherEvaluationFormPage({super.key, required this.teacherName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Evaluation Form'),
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
