import 'package:darwishproject/firebase_options.dart';
import 'package:darwishproject/screens/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MedicalHorizonsApp());
}

class MedicalHorizonsApp extends StatelessWidget {
  const MedicalHorizonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WelcomePage());
  }
}
