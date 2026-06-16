import 'package:calculator/math.dart';
import 'package:flutter/material.dart';
import './widgets.dart';

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

  void calculateTotal(String input) {
    MathCalculations calculations = MathCalculations();
    String val1 = "";
    String val2 = "";
    String symbol = "";
    int location = 0;

    /* 
      TODO: add another else block to check if a period has been entered
      if so, add it to the value and set isDecimal to true
      if isDecimal is already true, display an error
    */
    for(int i = 0; i < input.length; i++) {
      if(num.tryParse(input[i]) != null) {
          val1 += input[i];
          location++; 
      } else {
        break;
      }
    }

    // we hit a non-number
    // so we need to fetch the symbol
    if(location < input.length) {
      symbol = input[location];
      location++;
    } else {
      return;
    }

    if(symbol != '+' && symbol != '-' && symbol != '*' && symbol != '/' ) {
      setState(() {
        displayField = 'ERROR: non-valid symbol entered';
      });
      return;
    } else {
      if(location < input.length) {
        for(int i = location; i < input.length; i++) {
          if(num.tryParse(input[i]) != null) {
             val2 += input[i];
          } else {
            setState(() {
              displayField = 'ERROR: non-number encountered';
            });
          }
        }
      } else {
        return;
      }
    }

    switch(symbol) {
      case '+':
      String calculatedValue = calculations.add(double.parse(val1), double.parse(val2)).toString();
        setState(() {
          displayField = calculatedValue.substring(0, calculatedValue.length - 2);
        });
      case '-':
      String calculatedValue = calculations.subtract(double.parse(val1), double.parse(val2)).toString();
        setState(() {
          displayField = calculatedValue.substring(0, calculatedValue.length - 2);
        }); 
      case '*':
        String calculatedValue = calculations.multiply(double.parse(val1), double.parse(val2)).toString();
        setState(() {
          displayField = calculatedValue.substring(0, calculatedValue.length - 2);
        });
      case '/':
        if(double.parse(val2) == 0) {
          setState(() {
            displayField = "ERROR: division by zero";
          });
        } else {
          String calculatedValue = calculations.divide(double.parse(val1), double.parse(val2)).toString();
          setState(() {
            displayField = calculatedValue.substring(0, calculatedValue.length - 2);
          });
        }
    }
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
                          calculateTotal(displayField);
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