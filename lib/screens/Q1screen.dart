import 'package:darwishproject/screens/Q2screen.dart';
import 'package:flutter/material.dart';

class Question1Page extends StatefulWidget {
  const Question1Page({super.key});

  @override
  _Question1PageState createState() => _Question1PageState();
}

class _Question1PageState extends State<Question1Page> {
  String? selectedOption;
  final options = ["Student", "MUST Employee", "Not MUSTainian"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Which of these best describes you?",
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ...options.map((option) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedOption == option
                        ? Colors.green
                        : Colors.black87,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedOption = option;
                      print(selectedOption);
                    });
                  },
                  child: Text(option, style: TextStyle(fontSize: 16)),
                ),
              );
            }),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
              onPressed: selectedOption == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Question2Page(role: selectedOption!),
                        ),
                      );
                    },
              child: Text("Continue", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
