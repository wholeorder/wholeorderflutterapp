import 'package:flutter/material.dart';
import 'package:wholeorderclient/global/colors.dart';
import 'package:wholeorderclient/screens/login/login.dart';
import 'package:wholeorderclient/screens/password/new_password.dart';
import 'package:wholeorderclient/screens/password/password_forgotten.dart';
import 'package:wholeorderclient/screens/register/entreprise_info.dart';
import 'package:wholeorderclient/screens/register/fournisseur_info.dart';
import 'package:wholeorderclient/screens/register/otp.dart';
import 'package:wholeorderclient/screens/register/register.dart';
import 'package:wholeorderclient/screens/register/upload_photo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.myColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: NewPassword(),
    );
  }
}

 