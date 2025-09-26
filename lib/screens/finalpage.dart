import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/third.jpg"), // Replace
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Thank you for sharing your details!",
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              "Your health journey starts now.\nStay active, stay healthy.",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Exit", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
