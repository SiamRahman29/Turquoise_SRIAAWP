import 'package:flutter/material.dart';
import 'MonthlyForm.dart' as MonthlyForm;
import 'YearlyForm.dart' as YearlyForm;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TeacherModule(),
    );
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
                // Handle the selected year, e.g., submit the evaluation
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Selected Year'),
                      content: Text('Selected Year: $selectedYear'),
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
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous page (TeacherModule)
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YearlyForm
                        .MyForm(), // Assuming myForm is a static method in MonthlyForm
                  ),
                );
              },
              child: const Text('Start Evaluation'),
            ),
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
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous page (TeacherModule)
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MonthlyForm
                        .MyForm(), // Assuming myForm is a static method in MonthlyForm
                  ),
                );
              },
              child: const Text('Start Evaluation'),
            ),
          ],
        ),
      ),
    );
  }
}

