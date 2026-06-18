import 'package:calculator/math_functions.dart';
import 'package:flutter/material.dart';
import './widgets.dart';

String displayField = '0';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MathCalculations calculations = MathCalculations();
  
  /*DISPLAY FIELD MODIFICATION METHODS*/
  void updateDisplayField(String value) {
    if(value == '0' && displayField == '0') {
      return;
    } else if(displayField.startsWith('ERROR') || displayField == '0') {
      setState(() {
        displayField = '';
      });
    }
    
    if (displayField.length != 25) {
      setState(() {
        displayField += value;
      });
    }
  }

  // resets the display field
  void clearDisplayField() {
    setState(() {
      displayField = '0';
    });
  }
  
  // removes the last entered value from the display field
  void backspaceDisplayField() {
    if(displayField.startsWith('ERROR')) {
      setState(() {
        displayField = '';
      });
    } else if(displayField.length == 1) {
      setState(() {
        displayField = '0';
      });
    } else if(displayField.isNotEmpty) {
      setState(() {
        displayField = displayField.substring(0, displayField.length - 1);
      });
    }
  }

  void displayTotalInDisplayField(String calculatedValue) {
    setState(() {
      if(calculatedValue[calculatedValue.length - 1] != "0") {
        displayField = calculatedValue;
      } else {
        displayField = calculatedValue.substring(0, calculatedValue.length - 2);
      }
  });
  }

  void displayMessageInDisplayField(String message) {
    if(message.endsWith('.0')) {
      setState(() {
        displayField = message.substring(0, message.length - 2);
      });
    } else {
      setState(() {
        displayField = message;
      });
    }
    
  }
  /*END DISPLAY FIELD MODIFICATION METHODS*/

  // a helper method used by calculations that
  // take in only one number
  // if any non-number/decimal symbols are found
  // will return false
  // otheriwse returns true
  bool validateSingleNumber(String input) {
    bool isDecimal = false;

    if(input[0] == '.') {
      return false;
    }

    for(int i = 0; i < input.length; i++) {
      if(isDecimal) {
        return false;
      }

      if(input[i] == '.') {
        isDecimal = true;
      } else if(num.tryParse(input[i]) == null) {
        return false;
      }
    }
    return true;
  }

  void calculateReciprocal() {
    if(!validateSingleNumber(displayField)) {
      displayMessageInDisplayField('ERROR: please enter one number');
      return;
    }

    String reciprocal = calculations.reciprocal(double.parse(displayField)).toString();

    displayTotalInDisplayField(reciprocal);
  }

  void calculateSquareRoot() {
    if(!validateSingleNumber(displayField)) {
      displayMessageInDisplayField('ERROR: please enter one number');
      return;
    }

    String squareRoot = calculations.squareRoot(double.parse(displayField)).toString();

    displayTotalInDisplayField(squareRoot);
  }

  void calculateFactorial() {
    if(!validateSingleNumber(displayField)) {
      displayMessageInDisplayField('ERROR: please enter one number');
      return;
    }

    if(double.parse(displayField) < 0) {
      displayMessageInDisplayField('ERROR: value must be 0 or greater');
      return;
    }

    String factorial = calculations.factorial(int.parse(displayField)).toString();

    displayTotalInDisplayField(factorial);
  }

  void performSymbolCalculation(String symbol, String val1, String val2) {
    switch(symbol) {
      case '+':
        String calculatedValue = calculations.add(double.parse(val1), double.parse(val2)).toString();
        displayTotalInDisplayField(calculatedValue);
      case '-':
        String calculatedValue = calculations.subtract(double.parse(val1), double.parse(val2)).toString();
        displayTotalInDisplayField(calculatedValue);  
      case '*':
        String calculatedValue = calculations.multiply(double.parse(val1), double.parse(val2)).toString();
        displayTotalInDisplayField(calculatedValue);
      case '/':
        if(double.parse(val2) == 0) {
          displayMessageInDisplayField('ERROR: division by zero');
        } else {
          String calculatedValue = calculations.divide(double.parse(val1), double.parse(val2)).toString();
          displayTotalInDisplayField(calculatedValue);
        }
      case '^':
        String calculatedValue = calculations.power(double.parse(val1), double.parse(val2)).toString();
        displayTotalInDisplayField(calculatedValue);
    }
  }

  // parses the numbers and symbol input into the display field
  // then calls the corresponding function and sets display field to the total
  // displays an error in displayField as needed
  void calculateTotal(String input) {
    String val1 = "";
    String val2 = "";
    String symbol = "";
    int position = 0;
    bool isDecimal = false;

    // parses the string and gathers the numbers found into the first value
    // a position value is incremented to keep track of where we are in the string
    // once a non-number is found, breaks out of the loop
    for(int i = 0; i < input.length; i++) {
      if(num.tryParse(input[i]) != null) {
          val1 += input[i];
      } else if(input[i] == '.') {
        if(!isDecimal) {
          val1 += input[i];
          isDecimal = true;
        } else {
          displayMessageInDisplayField('ERROR: too many decimal points');
          return;
        }
      } else {
        isDecimal = false;
        position = i;
        break;
      }
    }

    // if end of displayField is reached
    // then exit the method
    // otherwise set symbol equal to value
    // and move to next position
    if(position < input.length) {
      symbol = input[position];
      position++;
    } else {
      return;
    }

    // if symbol is not a valid symbol
    // then set displayField to an error 
    // and exit the method
    if(symbol != '+' && symbol != '-' && symbol != '*' && symbol != '/' && symbol != '^') {
      setState(() {
        displayField = 'ERROR: non-valid symbol entered';
      });
      return;
    }
    
    // if end of string is not reached
    // then parse the second value
    // if a non-number is encountered
    // set an error and exit the method
    // if end of string is reached
    // then exit the method
    if(position >= input.length) {
      return;
    }

    for(int i = position; i < input.length; i++) {
      if(num.tryParse(input[i]) != null) {
          val2 += input[i];
      } else if(input[i] == '.') {
        if(!isDecimal) {
          val2 += input[i];
          isDecimal = true;
        } else {
          displayMessageInDisplayField('ERROR: too many decimal points');
          return;
        }
      } else {
        displayMessageInDisplayField('ERROR: too many symbols entered');
        return;
      }
    }

    // call the associated function for the symbol entered by the user
    // and input the val1 and val2 variables
    // then set displayField to display the value
    performSymbolCalculation(symbol, val1, val2);
  }
  
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
            Row(
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
                        buttonText: '.', 
                        onPressed: (value) {
                          updateDisplayField(value);
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
                        buttonText: 'C', 
                        onPressed: (_) {
                          clearDisplayField();
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
                          calculateReciprocal();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: '√', 
                        onPressed: (value) {
                          calculateSquareRoot();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CalcButton(
                        buttonText: 'n!', 
                        onPressed: (value) {
                          calculateFactorial();
                        },
                      ),
                    ),
                  ],),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            Column(
                children: [
                  CalcButton(
                    buttonText: 'Calculate', 
                    onPressed: (_) {
                      calculateTotal(displayField);
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}