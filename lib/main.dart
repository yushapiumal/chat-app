import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yp_chatapp/screen%20/otp_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OTPVerificationScreen(),
    );
  }
}





