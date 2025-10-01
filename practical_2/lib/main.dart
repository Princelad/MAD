import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: Calculator()));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? num;
  int? number1;
  int? number2;
  int? res;
  String? operation;

  void setNumber1(int number) {
    setState(() {
      number1 = number;
    });
  }

  void setNumber2(int number) {
    setState(() {
      number2 = number;
    });
  }

  void setOperator(String oprator) {
    setState(() {
      operation = oprator;
    });
  }

  void getRes() {
    setState(() {
      switch (operation) {
        case "+":
          res = number1! + number2!;
          break;
        case "-":
          res = number1! - number2!;
          break;
        case "*":
          res = number1! * number2!;
          break;
        case "/":
          if (number2 != 0) {
            res = number1! ~/ number2!;
          } else {
            res = null; // or handle divide by zero as needed
          }
          break;
        case "%":
          if (number2 != 0) {
            res = number1! % number2!;
          } else {
            res = null;
          }
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFcdd6f4),
          ),
        ),
        backgroundColor: Color(0xFF89B4FA),
      ),
      body: Container(
        color: Color(0xFF1e1e2e),
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.2),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          res != null
                              ? "$number1 $operation $number2 = $res"
                              : (number1 != null &&
                                    operation != null &&
                                    number2 != null)
                              ? "$number1 $operation $number2"
                              : (number1 != null && operation != null)
                              ? "$number1 $operation"
                              : (number1 != null)
                              ? "$number1"
                              : "0",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFFcdd6f4),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Number buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 1; i <= 3; i++)
                          ElevatedButton(
                            onPressed: () {
                              if (operation == null) {
                                setNumber1(((number1 ?? 0) * 10) + i);
                              } else {
                                setNumber2(((number2 ?? 0) * 10) + i);
                              }
                            },
                            child: Text("$i"),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 4; i <= 6; i++)
                          ElevatedButton(
                            onPressed: () {
                              if (operation == null) {
                                setNumber1(((number1 ?? 0) * 10) + i);
                              } else {
                                setNumber2(((number2 ?? 0) * 10) + i);
                              }
                            },
                            child: Text("$i"),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 7; i <= 9; i++)
                          ElevatedButton(
                            onPressed: () {
                              if (operation == null) {
                                setNumber1(((number1 ?? 0) * 10) + i);
                              } else {
                                setNumber2(((number2 ?? 0) * 10) + i);
                              }
                            },
                            child: Text("$i"),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (operation == null) {
                              setNumber1(((number1 ?? 0) * 10));
                            } else {
                              setNumber2(((number2 ?? 0) * 10));
                            }
                          },
                          child: Text("0"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              number1 = null;
                              number2 = null;
                              operation = null;
                              res = null;
                            });
                          },
                          child: Text("C"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            getRes();
                          },
                          child: Text("="),
                        ),
                      ],
                    ),
                    // Operator buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var op in ['+', '-', '*', '/', '%'])
                          ElevatedButton(
                            onPressed: () {
                              if (number1 != null && operation == null) {
                                setOperator(op);
                              }
                            },
                            child: Text(op),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
