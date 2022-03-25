import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shodaimama_bill/screens/dashboard_screen.dart';
import 'package:shodaimama_bill/screens/login_page.dart';
import 'package:shodaimama_bill/services/secure_storage.dart';

String? otpNo;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    getValidation().whenComplete(
      () async {
        Timer(
          const Duration(seconds: 2),
          () =>
              // setState(() {
              // phoneController.text.isEmpty
              //     ? _validate = true
              //     :
              Navigator.pushReplacement(
            context,
            PageTransition(
              child: otpNo == null ? const LoginPage() : DashboardScreen(),
              type: PageTransitionType.leftToRightWithFade,
            ),
          ),
          // })
        );
      },
    );

    super.initState();
  }

  Future getValidation() async {
    var obtainedOTP = await secureStorage.read1SecureData('OTP');
    setState(() {
      otpNo = obtainedOTP;
    });
  }

  // @override
  // void dispose() {
  //   phoneController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircleAvatar(
          child: Icon(Icons.local_activity),
        ),
      ),
    );
  }
}
