import 'package:flutter/material.dart';

class HomeFournisseur extends StatefulWidget {
  const HomeFournisseur({super.key});

  @override
  State<HomeFournisseur> createState() => _HomeFournisseurState();
}

class _HomeFournisseurState extends State<HomeFournisseur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(color: Colors.red,)),
    );
  }
}