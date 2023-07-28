import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../data/button_name.dart';
import '../widgets/my_button.dart';

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  final TextEditingController _textEditingController = TextEditingController();
  String answer = '';
  final _formKey = GlobalKey<FormState>();

  void _pushedButton(String number) {
    _textEditingController.text += number;
  }

  void equalPressed() {
    String finaluserinput = _textEditingController.text;
    finaluserinput = _textEditingController.text.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Calculator',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Empty!';
                  }
                  if (value!.contains(RegExp(r'^[0-9]+$'))) {
                    return 'Need operations';
                  }
                  if (!value.contains(RegExp(r'^[0-9+\-x*/.%]+$'))) {
                    return 'Only numbers and operations';
                  }
                  return null;
                },
                controller: _textEditingController,
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                padding: const EdgeInsets.all(1),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          _textEditingController.text = '';
                        });
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  }

                  if (index == 1) {
                    return MyButton(
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  }

                  if (index == 2) {
                    return MyButton(
                      color: Colors.blue.shade500,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          _textEditingController.text += buttons[index];
                        });
                      },
                    );
                  }

                  if (index == 3) {
                    return MyButton(
                      color: Colors.blue.shade500,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          if (_textEditingController.text == '') {
                            return;
                          } else {
                            _textEditingController.text =
                                _textEditingController.text.substring(
                                    0, _textEditingController.text.length - 1);
                          }
                        });
                      },
                    );
                  }

                  if (index == 18) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange.shade700,
                      textColor: Colors.white,
                    );
                  }

                  //  other buttons
                  else {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            _textEditingController.text += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepPurple,
                        textColor: Colors.white);
                  }
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemCount: buttons.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
