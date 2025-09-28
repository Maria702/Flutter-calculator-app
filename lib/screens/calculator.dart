import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String count = "";
  double result = 0;
  void clickButton(String value) {
    setState(() {
      count += value;
    });
    print("click me $value");
  }

  void clearAll() {
    setState(() {
      count = "";
      result = 0;
      print("Clear All $clearAll");
    });
  }

  void clear() {
    setState(() {
      if (count.isNotEmpty) {
        count = count.substring(0, count.length - 1);

        result = 0;
      }
    });
  }

  void output() {
    // Add
    if (count.contains("+")) {
      List<String> operations = count.split("+");
      if (operations.length == 2) {
        double num1 = double.parse(operations[0]);
        double num2 = double.parse(operations[1]);
        setState(() {
          result = num1 + num2;
        });
        print("result $result");
      }
    }
    // sub
    if (count.contains("-")) {
      List<String> operations = count.split("-");
      if (operations.length == 2) {
        double num1 = double.parse(operations[0]);
        double num2 = double.parse(operations[1]);
        setState(() {
          result = num1 - num2;
        });
        print("result $result");
      }
    }
    // multiply
    if (count.contains("x")) {
      List<String> operations = count.split("x");
      if (operations.length == 2) {
        double num1 = double.parse(operations[0]);
        double num2 = double.parse(operations[1]);
        setState(() {
          result = num1 * num2;
        });

        print("result $result");
      }
    }

    //divide
    if (count.contains("/")) {
      List<String> operations = count.split("/");

      if (operations.length == 2) {
        double num1 = double.parse(operations[0].trim());
        double num2 = double.parse(operations[1].trim());

        if (num2 == 0) {
          print("Error: Division by zero");
        } else {
          setState(() {
            result = num1 / num2;
          });
          print("Division result: $result");
        }
      } else {
        print("Invalid division format. ");
      }
    }

    // percentage
    if (count.contains("%")) {
      if (count[count.length - 1] == '%') {
        String numStr = count.substring(0, count.length - 1).trim();
        if (numStr.isNotEmpty) {
          double num = double.parse(numStr);
          setState(() {
            result = num / 100;
          });
          print("Percentage result: $result");
        }
      } else {
        print("Invalid percentage format.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            "Calculator App",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment(1.0, 1.0),
                      width: 400,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment(1.0, 1.0),
                              child: Text(
                                count,
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                            Container(
                              alignment: Alignment(1.0, 1.0),
                              child: Text(
                                result.toString(),
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () => {clearAll()},
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "AC ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clear();
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "C",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("%");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("/");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "/",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //2nd column
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("7");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "7",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("8");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "8",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("9");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "9",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("x");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "x",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("4");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "4",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("5");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "5",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("6");
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(70, 20),
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(
                              "6",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("-");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(70, 20),
                            ),
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //3 column
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("1");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(70, 20),
                            ),
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("2");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(70, 20),
                            ),
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("3");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(70, 20),
                            ),
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("+");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(70, 20),
                            ),
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // column4
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton("0");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(70, 20),
                            ),
                            child: Text(
                              "0",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              clickButton(".");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(70, 20),
                            ),
                            child: Text(
                              ".",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              output();
                              result.toString();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: Size(150, 20),
                            ),
                            child: Text(
                              "=",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
