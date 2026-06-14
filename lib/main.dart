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
    // allow longer fields eventually
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
    Math calculations = Math();
    String val1 = "";
    String val2 = "";
    String symbol = "";
    int location = 0;

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
      print('Symbol: not found.');
      return;
    }

    if(symbol != '+' && symbol != '-' && symbol != '*' && symbol != '/' ) {
      setState(() {
        displayField = 'ERROR: non-valid symbol entered';
      });      
    } else {
      if(location < input.length) {
        for(int i = location; i < input.length; i++) {
          if(num.tryParse(input[i]) == null) {
            setState(() {
              displayField = 'ERROR: non-number encountered';
            });    
          } else {
            val2 += input[i];
          }
        }
      } else {
        return;
      }
    }

    print('Val1: ' + val1);
    print('Symbol: ' + symbol);
    print('Val2: ' + val2);

    // then we process and pick our calculation to perform after
    // verifying string is all good

    /*
    if(num.tryParse(input[0]) != null && num.tryParse(input[2]) != null) {
      double val1 = double.parse(input[0]);
      double val2 = double.parse(input[2]);
      // make this not display decimal point for three main functions
      switch(symbol) {
        case '+':
          setState(() {
            displayField = calculations.add(val1, val2).toString();
          });
        case '-':
          setState(() {
            displayField = calculations.subtract(val1, val2).toString();
          }); 
        case '*':
          setState(() {
            displayField = calculations.multiply(val1, val2).toString();
          });
        case '/':
          if(val2 == 0) {
            setState(() {
              displayField = "ERROR: cannot divide by zero.";
            });
          } else {
            setState(() {
              displayField = calculations.divide(val1, val2).toString();
            });
          }
      }
    }
    */
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