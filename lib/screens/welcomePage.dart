import 'package:darwishproject/screens/splashPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/first.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Small daily habits create big changes in your health.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashPage()),
                );
              },
              child: Text("Go", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
