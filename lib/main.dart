import 'package:flutter/material.dart';
import './widgets.dart';
import './math.dart';

String displayField = "";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void updateDisplayField(String value) {
    setState(() {
      displayField += value;
    });
  }

  void clearDisplayField() {
    setState(() {
      displayField = "";
    });
  }
  
  void backspaceDisplayField() {
    setState(() {
      if(displayField.isNotEmpty) {
        displayField = displayField.substring(0, displayField.length - 1);
      }
    });
  }
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
              width: 500,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(displayField),
                      )
                    ),
                  ),
                  SizedBox(
                    child: Center(
                      child: CalcButton(
                      buttonText: '←', 
                      onPressed: (value) {
                        backspaceDisplayField();
                      },
                    ),
                    )
                  ),
                ],
              ),
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
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '4', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '1', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '0', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                  ],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '8', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '5', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '2', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: 'C', 
                        onPressed: (_) {
                          clearDisplayField();
                        }
                      ),
                    ),
                  ],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '9', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '6', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '3', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '=', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                  ],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '+', 
                        onPressed:(value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '-', 
                        onPressed:(value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '*', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '/', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                  ],),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '^', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '1/x', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '√', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: 'n!', 
                        onPressed: (value) {
                          updateDisplayField(value);
                        },
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