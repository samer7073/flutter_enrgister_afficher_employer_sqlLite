// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Register Nouveau Employer")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listemployers');
                },
                child: Text("Lister les empolyeur"))
          ],
        ),
      ),
    );
  }
}
