import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff0288D1),
        ),
      )
    );
  }
}