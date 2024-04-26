import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyForm(),
      debugShowCheckedModeBanner: false
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Informasi Guru\nPersonal Info'),
    const Tab(text: 'PDP'),
    const Tab(text: 'Program Sekolah\nSchool Activity'),
    const Tab(text: 'Tarbiyyah'),
    const Tab(text: 'Peningkatan Diri\nSelf-Improvement'),
    const Tab(text: 'Penglibatan Luar\nExternal Engagement'),
  ];

  final List<Widget> tabPages = <Widget>[
    const PersonalInfoTab(),
    const PdpTab(),
    const SchoolActivityTab(),
    const TarbiyyahTab(),
    const SelfImprovementTab(),
    const ExternalEngagementTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Borang Keberhasilan Guru Bulanan\nMonthly Evaluation'),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: tabPages,
        ),
      ),
    );
  }
}

class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({super.key});

  @override
  _PersonalInfoTabState createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  // Add your form fields and logic for Personal Info here
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Informasi Guru akan dimasukkan automatik \nPersonal Info will automatically filled'),
    );
  }
}

class PdpTab extends StatelessWidget {
  const PdpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bidang Tugas 1: PDP - 40%'),
          const SizedBox(height: 8.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contoh 1: 30% murid tahun 2 & 3 yang saya ajar dapat menguasai komunikasi dalam bahasa Inggeris dengan baik.'),
                Text('Contoh 2: 90% murid tahun 2 & 3 yang saya ajar mendapat Band 5 dalam pentaskiran akhir tahun untuk subjek English.'),
                Text('Contoh 3: 30% murid tahun 2 & 3 dapat membaca petikan Bahasa Inggeris dengan baik.'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const QuestionAnswerFormPdp(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _saveRecordsPdp(context),
            child: const Text('Simpan'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to the report page and pass the data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
  var formPdpKey = GlobalKey<_QuestionAnswerFormPdpState>();
  return PdpReportPage(qaList: formPdpKey.currentState?.qaList ?? []);
},
 ),
              );
            },
            child: const Text('Hantar'),
          ),
        ],
      ),
    );
  }
}

void _saveRecordsPdp(BuildContext context) {
    // Perform the logic to store the records (you can replace this with your actual logic)

    // Show a dialog to inform the user
    showDialog(
      context: context,
      builder: (BuildContext context) { 
        return AlertDialog(
          title: const Text('Save'),
          content: const Text('The records have been successfully stored.'),
          actions: [
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

class QuestionAnswerFormPdp extends StatefulWidget {
  const QuestionAnswerFormPdp({super.key});

  @override
  _QuestionAnswerFormPdpState createState() => _QuestionAnswerFormPdpState();
}

class _QuestionAnswerFormPdpState extends State<QuestionAnswerFormPdp> {
  final List<QuestionAnswerPdp> qaList = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
// Add this line to create GlobalKey
  final GlobalKey<_QuestionAnswerFormPdpState> formPdpKey = GlobalKey();
  
  void _addQuestionAnswer() {
    setState(() {
      String question = questionController.text;
      String answer = answerController.text;
      if (question.isNotEmpty && answer.isNotEmpty) {
        qaList.add(QuestionAnswerPdp(question: question, answer: answer));
        questionController.clear();
        answerController.clear();
      }
    });
  }

  void _editQuestionAnswer(QuestionAnswerPdp qa) {
    questionController.text = qa.question;
    answerController.text = qa.answer;

    setState(() {
      qaList.remove(qa);
    });
  }

  void _removeQuestionAnswer(QuestionAnswerPdp qa) {
    setState(() {
      qaList.remove(qa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(labelText: 'Sila masukkan Sasaran Kerja'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: answerController,
                      decoration: const InputDecoration(labelText: 'Penilainan Guru(Kendiri)/Self-Evaluation'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: _addQuestionAnswer,
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Sasaran Kerja yang telah direkodkan:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          if (qaList.isEmpty)
            const Text('Tiada rekod lagi.\nNo record now.')
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: qaList.map((qa) => _buildQuestionAnswerCard(qa)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswerCard(QuestionAnswerPdp qa) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Sasaran Kerja: ${qa.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('Markah Kendiri: ${qa.answer}'),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _editQuestionAnswer(qa),
                  child: const Text('Edit'),
                ),
                TextButton(
                  onPressed: () => _removeQuestionAnswer(qa),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionAnswerPdp {
  final String question;
  final String answer;

  QuestionAnswerPdp({required this.question, required this.answer});
}

class PdpReportPage extends StatelessWidget {
  final List<QuestionAnswerPdp> qaList;

  // Constructor
  const PdpReportPage({super.key, required this.qaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sasaran Kerja PDP', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            if (qaList.isEmpty)
              const Text('Tiada rekod.')
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: qaList.map((qa) => _buildQuestionAnswerRow(qa)).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswerRow(QuestionAnswerPdp qa) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.question, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.answer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class SchoolActivityTab extends StatelessWidget {
  const SchoolActivityTab({super.key});

    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bidang Tugas 2: Program Sekolah - 30%'),
          const SizedBox(height: 8.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contoh 1: Mengurus 80% pelaksanaan matapelajaran dengan menyelaras pentaksiran & tugasan murid.'),
                Text('Contoh 2: Mengurus 1 program peningkatan pencapaian murid(Cth: program pemantapan Bahasa Inggeris).'),
                Text('Contoh 3: Melaksanakan sekurang-kurangnya 80% tugasan panitia.'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const QuestionAnswerFormPS(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _saveRecordsPS(context),
            child: const Text('Simpan'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to the report page and pass the data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
  var formPSKey = GlobalKey<_QuestionAnswerFormPSState>();
  return PSReportPage(qaList: formPSKey.currentState?.qaList ?? []);
},
 ),
              );
            },
            child: const Text('Hantar'),
          ),
        ],
      ),
    );
  }
}

void _saveRecordsPS(BuildContext context) {
    // Perform the logic to store the records (you can replace this with your actual logic)

    // Show a dialog to inform the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save'),
          content: const Text('The records have been successfully stored.'),
          actions: [
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

class QuestionAnswerFormPS extends StatefulWidget {
  const QuestionAnswerFormPS({super.key});

  @override
  _QuestionAnswerFormPSState createState() => _QuestionAnswerFormPSState();
}

class _QuestionAnswerFormPSState extends State<QuestionAnswerFormPS> {
  final List<QuestionAnswerPS> qaList = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  void _addQuestionAnswer() {
    setState(() {
      String question = questionController.text;
      String answer = answerController.text;
      if (question.isNotEmpty && answer.isNotEmpty) {
        qaList.add(QuestionAnswerPS(question: question, answer: answer));
        questionController.clear();
        answerController.clear();
      }
    });
  }

  void _editQuestionAnswer(QuestionAnswerPS qa) {
    questionController.text = qa.question;
    answerController.text = qa.answer;

    setState(() {
      qaList.remove(qa);
    });
  }

  void _removeQuestionAnswer(QuestionAnswerPS qa) {
    setState(() {
      qaList.remove(qa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(labelText: 'Sila masukkan Sasaran Kerja'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: answerController,
                      decoration: const InputDecoration(labelText: 'Penilainan Guru(Kendiri)/Self-Evaluation'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: _addQuestionAnswer,
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Sasaran Kerja yang telah direkodkan:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          if (qaList.isEmpty)
            const Text('Tiada rekod lagi.\nNo record now.')
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: qaList.map((qa) => _buildQuestionAnswerCard(qa)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswerCard(QuestionAnswerPS qa) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Sasaran Kerja: ${qa.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('Markah Kendiri: ${qa.answer}'),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _editQuestionAnswer(qa),
                  child: const Text('Edit'),
                ),
                TextButton(
                  onPressed: () => _removeQuestionAnswer(qa),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionAnswerPS {
  final String question;
  final String answer;

  QuestionAnswerPS({required this.question, required this.answer});
}

class PSReportPage extends StatelessWidget {
  final List<QuestionAnswerPS> qaList; // Change to QuestionAnswerPS

  // Constructor
  const PSReportPage({super.key, required this.qaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sasaran Kerja PDP', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            if (qaList.isEmpty)
              const Text('Tiada rekod.')
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: qaList.map((qa) => _buildQuestionAnswerRowPS(qa)).toList(), // Change to _buildQuestionAnswerRowPS
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswerRowPS(QuestionAnswerPS qa) { // Change method name to _buildQuestionAnswerRowPS
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.question, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.answer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class TarbiyyahTab extends StatelessWidget {
  const TarbiyyahTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bidang Tugas 3: Tarbiyyah - 20%'),
          const SizedBox(height: 8.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contoh 1: Mencapai sekurang-kurangnya 25% kehadiran ke wasilah usrah fizikal/online.'),
                Text('Contoh 2: Mencapai sekurang-kurangnya 90% kehadiran ke usrah fizikal/online.'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const QuestionAnswerFormTarbiyyah(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _saveRecordsTarbiyyah(context),
            child: const Text('Simpan'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to the report page and pass the data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
  var formTarbiyyahKey = GlobalKey<_QuestionAnswerFormTarbiyyahState>();
  return TarbiyyahReportPage(qaList: formTarbiyyahKey.currentState?.qaList ?? []);
},
 ),
              );
            },
            child: const Text('Hantar'),
          ),
        ],
      ),
    );
  }
}

void _saveRecordsTarbiyyah(BuildContext context) {
    // Perform the logic to store the records (you can replace this with your actual logic)

    // Show a dialog to inform the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save'),
          content: const Text('The records have been successfully stored.'),
          actions: [
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

class QuestionAnswerFormTarbiyyah extends StatefulWidget {
  const QuestionAnswerFormTarbiyyah({super.key});

  @override
  _QuestionAnswerFormTarbiyyahState createState() => _QuestionAnswerFormTarbiyyahState();
}

class _QuestionAnswerFormTarbiyyahState extends State<QuestionAnswerFormTarbiyyah> {
  final List<QuestionAnswerTarbiyyah> qaList = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  void _addQuestionAnswer() {
    setState(() {
      String question = questionController.text;
      String answer = answerController.text;
      if (question.isNotEmpty && answer.isNotEmpty) {
        qaList.add(QuestionAnswerTarbiyyah(question: question, answer: answer));
        questionController.clear();
        answerController.clear();
      }
    });
  }

  void _editQuestionAnswer(QuestionAnswerTarbiyyah qa) {
    questionController.text = qa.question;
    answerController.text = qa.answer;

    setState(() {
      qaList.remove(qa);
    });
  }

  void _removeQuestionAnswer(QuestionAnswerTarbiyyah qa) {
    setState(() {
      qaList.remove(qa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(labelText: 'Sila masukkan Sasaran Kerja'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: answerController,
                      decoration: const InputDecoration(labelText: 'Penilainan Guru(Kendiri)/Self-Evaluation'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: _addQuestionAnswer,
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Sasaran Kerja yang telah direkodkan:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          if (qaList.isEmpty)
            const Text('Tiada rekod lagi.\nNo record now.')
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: qaList.map((qa) => _buildQuestionAnswerCard(qa)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswerCard(QuestionAnswerTarbiyyah qa) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Sasaran Kerja: ${qa.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('Markah Kendiri: ${qa.answer}'),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _editQuestionAnswer(qa),
                  child: const Text('Edit'),
                ),
                TextButton(
                  onPressed: () => _removeQuestionAnswer(qa),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionAnswerTarbiyyah {
  final String question;
  final String answer;

  QuestionAnswerTarbiyyah({required this.question, required this.answer});
}

class TarbiyyahReportPage extends StatelessWidget {
  final List<QuestionAnswerTarbiyyah> qaList; // Change to QuestionAnswerPS

  // Constructor
  const TarbiyyahReportPage({super.key, required this.qaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sasaran Kerja Tarbiyyah', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            if (qaList.isEmpty)
              const Text('Tiada rekod.')
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: qaList.map((qa) => _buildQuestionAnswerRowTarbiyyah(qa)).toList(), // Change to _buildQuestionAnswerRowPS
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswerRowTarbiyyah(QuestionAnswerTarbiyyah qa) { // Change method name to _buildQuestionAnswerRowPS
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.question, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.answer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelfImprovementTab extends StatelessWidget {
  const SelfImprovementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bidang Tugas 4: Peningkatan Diri - 10%'),
          const SizedBox(height: 8.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contoh 1: Menyertai 1 kursus luar sekolah. Cth : kursus eduoasis yang berkaitan dengan subjek diajar.'),
                Text('Contoh 2: Menjadi 1 kali sekurang2-nya sukarela tenaga pengajar sukan apabila kesihatan mengizinkan.'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const QuestionAnswerFormPD(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _saveRecordsPD(context),
            child: const Text('Simpan'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to the report page and pass the data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
  var formPDKey = GlobalKey<_QuestionAnswerFormPDState>();
  return PDReportPage(qaList: formPDKey.currentState?.qaList ?? []);
},
 ),
              );
            },
            child: const Text('Hantar'),
          ),
        ],
      ),
    );
  }
}

void _saveRecordsPD(BuildContext context) {
    // Perform the logic to store the records (you can replace this with your actual logic)

    // Show a dialog to inform the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save'),
          content: const Text('The records have been successfully stored.'),
          actions: [
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

class QuestionAnswerFormPD extends StatefulWidget {
  const QuestionAnswerFormPD({super.key});

  @override
  _QuestionAnswerFormPDState createState() => _QuestionAnswerFormPDState();
}

class _QuestionAnswerFormPDState extends State<QuestionAnswerFormPD> {
  final List<QuestionAnswerPD> qaList = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  void _addQuestionAnswer() {
    setState(() {
      String question = questionController.text;
      String answer = answerController.text;
      if (question.isNotEmpty && answer.isNotEmpty) {
        qaList.add(QuestionAnswerPD(question: question, answer: answer));
        questionController.clear();
        answerController.clear();
      }
    });
  }

  void _editQuestionAnswer(QuestionAnswerPD qa) {
    questionController.text = qa.question;
    answerController.text = qa.answer;

    setState(() {
      qaList.remove(qa);
    });
  }

  void _removeQuestionAnswer(QuestionAnswerPD qa) {
    setState(() {
      qaList.remove(qa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(labelText: 'Sila masukkan Sasaran Kerja'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: answerController,
                      decoration: const InputDecoration(labelText: 'Penilainan Guru(Kendiri)/Self-Evaluation'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: _addQuestionAnswer,
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Sasaran Kerja yang telah direkodkan:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          if (qaList.isEmpty)
            const Text('Tiada rekod lagi.\nNo record now.')
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: qaList.map((qa) => _buildQuestionAnswerCard(qa)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswerCard(QuestionAnswerPD qa) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Sasaran Kerja: ${qa.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('Markah Kendiri: ${qa.answer}'),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _editQuestionAnswer(qa),
                  child: const Text('Edit'),
                ),
                TextButton(
                  onPressed: () => _removeQuestionAnswer(qa),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionAnswerPD {
  final String question;
  final String answer;

  QuestionAnswerPD({required this.question, required this.answer});
}

class PDReportPage extends StatelessWidget {
  final List<QuestionAnswerPD> qaList; 

  // Constructor
  const PDReportPage({super.key, required this.qaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sasaran Kerja Peningkatan Diri', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            if (qaList.isEmpty)
              const Text('Tiada rekod.')
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: qaList.map((qa) => _buildQuestionAnswerRowPD(qa)).toList(), // Change to _buildQuestionAnswerRowPS
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswerRowPD(QuestionAnswerPD qa) { // Change method name to _buildQuestionAnswerRowPS
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.question, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.answer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExternalEngagementTab extends StatelessWidget {
  const ExternalEngagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bidang Tugas 5: Penglibatan Luar - BONUS 10%'),
          const SizedBox(height: 8.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contoh 1: Menyertai program luar sekolah di luar waktu persekolahan.'),
                Text('Contoh 2: Membawa murid dalam sebarang pertandingan atau persembahan luar sekolah. '),
                Text('Contoh 3: Menyertai aktiviti welfare yang diorganasi oleh persatuan NGO. '),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const QuestionAnswerFormPL(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _saveRecordsPL(context),
            child: const Text('Save'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to the report page and pass the data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
  var formPLKey = GlobalKey<_QuestionAnswerFormPLState>();
  return PLReportPage(qaList: formPLKey.currentState?.qaList ?? []);
},
 ),
              );
            },
            child: const Text('Hantar'),
          ),
        ],
      ),
    );
  }
}

void _saveRecordsPL(BuildContext context) {
    // Perform the logic to store the records (you can replace this with your actual logic)

    // Show a dialog to inform the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save'),
          content: const Text('The records have been successfully stored.'),
          actions: [
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

class QuestionAnswerFormPL extends StatefulWidget {
  const QuestionAnswerFormPL({super.key});

  @override
  _QuestionAnswerFormPLState createState() => _QuestionAnswerFormPLState();
}

class _QuestionAnswerFormPLState extends State<QuestionAnswerFormPL> {
  final List<QuestionAnswerPL> qaList = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  void _addQuestionAnswer() {
    setState(() {
      String question = questionController.text;
      String answer = answerController.text;
      if (question.isNotEmpty && answer.isNotEmpty) {
        qaList.add(QuestionAnswerPL(question: question, answer: answer));
        questionController.clear();
        answerController.clear();
      }
    });
  }

  void _editQuestionAnswer(QuestionAnswerPL qa) {
    questionController.text = qa.question;
    answerController.text = qa.answer;

    setState(() {
      qaList.remove(qa);
    });
  }

  void _removeQuestionAnswer(QuestionAnswerPL qa) {
    setState(() {
      qaList.remove(qa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(labelText: 'Sila masukkan Sasaran Kerja'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: answerController,
                      decoration: const InputDecoration(labelText: 'Penilainan Guru(Kendiri)/Self-Evaluation'),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: _addQuestionAnswer,
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Sasaran Kerja yang telah direkodkan:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          if (qaList.isEmpty)
            const Text('Tiada rekod lagi.\nNo record now.')
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: qaList.map((qa) => _buildQuestionAnswerCard(qa)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswerCard(QuestionAnswerPL qa) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Sasaran Kerja: ${qa.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('Markah Kendiri: ${qa.answer}'),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _editQuestionAnswer(qa),
                  child: const Text('Edit'),
                ),
                TextButton(
                  onPressed: () => _removeQuestionAnswer(qa),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionAnswerPL {
  final String question;
  final String answer;

  QuestionAnswerPL({required this.question, required this.answer});
}

class PLReportPage extends StatelessWidget {
  final List<QuestionAnswerPL> qaList; 

  // Constructor
  const PLReportPage({super.key, required this.qaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sasaran Kerja Penglibatan Luar', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            if (qaList.isEmpty)
              const Text('Tiada rekod.')
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: qaList.map((qa) => _buildQuestionAnswerRowPL(qa)).toList(), // Change to _buildQuestionAnswerRowPS
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswerRowPL(QuestionAnswerPL qa) { // Change method name to _buildQuestionAnswerRowPS
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.question, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(qa.answer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}