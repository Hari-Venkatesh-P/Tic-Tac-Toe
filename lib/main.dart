import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/blocs/game_blocs.dart';
import 'package:tic_tac_toe/screens/SplashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=>GameBlocs(),
        child: MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    ));
  }
}
