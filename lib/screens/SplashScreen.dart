import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/HomeSreen.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tic',
                style: TextStyle(
                  fontSize: 32,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                'Tac',
                style: TextStyle(
                  fontSize: 32,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                'Toe',
                style: TextStyle(
                  fontSize: 32,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ));
  }
}
