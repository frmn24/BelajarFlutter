import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nilai1Controller = TextEditingController();
  TextEditingController bobot1Controller = TextEditingController();
  TextEditingController nilai2Controller = TextEditingController();
  TextEditingController bobot2Controller = TextEditingController();
  TextEditingController nilai3Controller = TextEditingController();
  TextEditingController bobot3Controller = TextEditingController();

  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Rata-rata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            buildInputField('Nilai Mata Pelajaran 1', nilai1Controller),
            buildInputField('Bobot Mata Pelajaran 1', bobot1Controller),
            buildInputField('Nilai Mata Pelajaran 2', nilai2Controller),
            buildInputField('Bobot Mata Pelajaran 2', bobot2Controller),
            buildInputField('Nilai Mata Pelajaran 3', nilai3Controller),
            buildInputField('Bobot Mata Pelajaran 3', bobot3Controller),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                hitungrata();
              },
              child: Text('Hitung Rata-rata'),
            ),
            SizedBox(height: 16),
            Text('Rata-rata Berbobot: $result'),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 12),
      ],
    );
  }

  void hitungrata() {
    double nilai1 = double.tryParse(nilai1Controller.text) ?? 0.0;
    double bobot1 = double.tryParse(bobot1Controller.text) ?? 0.0;
    double nilai2 = double.tryParse(nilai2Controller.text) ?? 0.0;
    double bobot2 = double.tryParse(bobot2Controller.text) ?? 0.0;
    double nilai3 = double.tryParse(nilai3Controller.text) ?? 0.0;
    double bobot3 = double.tryParse(bobot3Controller.text) ?? 0.0;

    double totalBobot = bobot1 + bobot2 + bobot3;

    if (totalBobot != 0) {
      setState(() {
        result =
            (nilai1 * bobot1 + nilai2 * bobot2 + nilai3 * bobot3) / totalBobot;
      });
    } else {
      setState(() {
        result = 0.0;
      });
    }
  }
}
