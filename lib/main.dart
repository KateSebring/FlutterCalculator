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
  // a function that will add the value to the displayField
  // if an error occured and was displayed
  // then the displayField is first cleared before adding the value
  void updateDisplayField(String value) {
    if(displayField.startsWith("ERROR")) {
      setState(() {
        displayField = "";
      });
    }

    setState(() {
      displayField += value;
    });
  }

  // resets the display field
  void clearDisplayField() {
    setState(() {
      displayField = "";
    });
  }
  
  // removes the last entered value from the display field
  void backspaceDisplayField() {
    setState(() {
      if(displayField.isNotEmpty) {
        displayField = displayField.substring(0, displayField.length - 1);
      }
    });
  }

  // parses the numbers and symbol input into the display field
  // then calls the corresponding function and sets display field to the total
  // displays an error in displayField as needed
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
    // parses the string and gathers the numbers found into the first value
    // a location value is incremented to keep track of where we are in the string
    // once a non-number is found, breaks out of the loop
    for(int i = 0; i < input.length; i++) {
      if(num.tryParse(input[i]) != null) {
          val1 += input[i];
          location++; 
      } else {
        break;
      }
    }

    // a non-number was encountered
    // before we try to process the symbol, we ensure that 
    // we did not reach the end of the string
    // if we did reach the end of the string, nothing happens
    // otherwise, the symbol will be fetched from our current location in the string
    // then the location index will be incremented
    if(location < input.length) {
      symbol = input[location];
      location++;
    } else {
      return;
    }

    // if the symbol entered is not a valid symbol
    // then display an error
    // otherwise continue parsing the string for numbers
    // and building value 2
    // if any non-number is encountered, display an error
    // if we reached the end of the string already when
    // we read the symbol, nothing happens
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

    // call the associated function for the symbol entered by the user
    // and input the val1 and val2 variables
    // then set displayField to display the value
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
            if(calculatedValue[calculatedValue.length - 1] != "0") {
              displayField = calculatedValue;
            } else {
              displayField = calculatedValue.substring(0, calculatedValue.length - 2);
            }
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
                          // TODO replace this function with a calculateInverse function
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '√', 
                        onPressed: (value) {
                          // TODO replace this function with a calculateSquareRoot function
                          updateDisplayField(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: 'n!', 
                        onPressed: (value) {
                          // TODO replace this function with a calculateFactorial function
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