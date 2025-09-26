import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darwishproject/models/usermodel.dart';
import 'package:darwishproject/screens/finalpage.dart';
import 'package:flutter/material.dart';

class Question3Page extends StatefulWidget {
  final String role, gender;
  final double height, weight;

  const Question3Page({
    super.key,
    required this.role,
    required this.gender,
    required this.height,
    required this.weight,
  });

  @override
  State<Question3Page> createState() => _Question3PageState();
}

class _Question3PageState extends State<Question3Page> {
  final sugarController = TextEditingController();
  final heartRateController = TextEditingController();
  final bpController = TextEditingController();

  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  void _submit() async {
    if (sugarController.text.trim().isEmpty) {
      _showError("Please enter your blood sugar level.");
      return;
    }
    if (heartRateController.text.trim().isEmpty) {
      _showError("Please enter your heart rate.");
      return;
    }
    if (bpController.text.trim().isEmpty) {
      _showError("Please enter your blood pressure.");
      return;
    }

    // Try to parse numbers
    double? sugar = double.tryParse(sugarController.text.trim());
    double? heartRate = double.tryParse(heartRateController.text.trim());
    double? bp = double.tryParse(bpController.text.trim());

    if (sugar == null || heartRate == null || bp == null) {
      _showError("Please enter valid numbers in all fields.");
      return;
    }
    Usermodel user = Usermodel(
      role: widget.role,
      gender: widget.gender,
      weight: widget.weight,
      height: widget.height,
      heartrate: heartRate,
      bloodsugar: sugar,
      bloodpressure: bp,
    );
    try {
      // ✅ Save to Firestore under "users" collection
      await FirebaseFirestore.instance.collection("users").add(user.toMap());

      // ✅ Navigate forward only if save succeeded
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FinalPage()),
      );
    } catch (e) {
      _showError("Error saving data: $e");
    }
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("What is your blood sugar level?"),
                  TextField(
                    controller: sugarController,
                    keyboardType: TextInputType.number,
                    decoration: _blackInputDecoration("Enter value"),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 12),

                  Text("What is your heart rate (pulse)?"),
                  TextField(
                    controller: heartRateController,
                    keyboardType: TextInputType.number,
                    decoration: _blackInputDecoration("Enter value"),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 12),

                  Text("What is your blood pressure?"),
                  TextField(
                    controller: bpController,
                    keyboardType: TextInputType.number,
                    decoration: _blackInputDecoration("Enter value"),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 24),

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
                      onPressed: _submit,
                      child: Text("Submit", style: TextStyle(fontSize: 18)),
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

  InputDecoration _blackInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.black,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white54),
    );
  }
}
