import 'package:flutter/material.dart';

class HomeEntreprise extends StatefulWidget {
  const HomeEntreprise({super.key});

  @override
  State<HomeEntreprise> createState() => _HomeEntrepriseState();
}

class _HomeEntrepriseState extends State<HomeEntreprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.blue,
      )),
    );
  }
}
