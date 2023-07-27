import 'package:flutter/material.dart';

import '../data/button_name.dart';
import '../widgets/my_button.dart';

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  void _pushedButton(String number) {
    _textEditingController.text += number;
  }

  void equalPressed() {
    String finaluserinput = _textEditingController.text;
    finaluserinput = _textEditingController.text.replaceAll('x', '*');
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
              child: TextField(
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
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
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
                      textColor: Colors.black,
                      buttonText: buttons[index],
                    );
                  }

                  if (index == 2) {
                    return MyButton(
                      color: Colors.blue.shade500,
                      textColor: Colors.black,
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
                      textColor: Colors.black,
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
                    crossAxisCount: 4),
                itemCount: buttons.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
