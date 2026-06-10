import 'package:flutter/material.dart';
import './widgets.dart';
import './math.dart';

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
        body: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text('This is my display field'),
              )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '7', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '4', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '1', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '0', 
                  onPressed: () => {}
                ),
              ),
            ],),
            Column(children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '8', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '5', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '2', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: 'C', 
                  onPressed: () => {}
                ),
              ),
            ],),
            Column(children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '9', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '6', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '3', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '=', 
                  onPressed: () => {}
                ),
              ),
            ],),
            Column(children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '+', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '-', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '*', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '/', 
                  onPressed: () => {}
                ),
              ),
            ],),
            Column(children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '^', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '1/x', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: '√', 
                  onPressed: () => {}
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: CalcButton(
                  buttonText: 'n!', 
                  onPressed: () => {}
                ),
              ),
            ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}