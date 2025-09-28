import 'package:darwishproject/screens/Q3screen.dart';
import 'package:flutter/material.dart';

class Question2Page extends StatefulWidget {
  const Question2Page({super.key, required this.role});
  final String role;

  @override
  _Question2PageState createState() => _Question2PageState();
}

class _Question2PageState extends State<Question2Page> {
  String? gender;
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  void _continue() {
    if (gender == null) {
      _showError("Please select your gender.");
      return;
    }

    if (weightController.text.trim().isEmpty) {
      _showError("Please enter your weight.");
      return;
    }

    if (heightController.text.trim().isEmpty) {
      _showError("Please enter your height.");
      return;
    }

    double? weight = double.tryParse(weightController.text.trim());
    double? height = double.tryParse(heightController.text.trim());

    if (weight == null || height == null) {
      _showError("Please enter valid numeric values.");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Question3Page(
          role: widget.role,
          gender: gender!,
          weight: weight,
          height: height,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "What is your gender?",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),

                  RadioListTile(
                    title: Text("Male"),
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() => gender = value.toString());
                    },
                  ),
                  RadioListTile(
                    title: Text("Female"),
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() => gender = value.toString());
                    },
                  ),

                  const SizedBox(height: 12),
                  const Text("What is your weight?"),
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter weight (kg)",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 12),
                  const Text("What is your height?"),
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter height (cm)",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 16,
                        ),
                      ),
                      onPressed: _continue,
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
