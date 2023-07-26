import 'package:calculator/widgets/button_item.dart';
import 'package:flutter/material.dart';

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  final TextEditingController _textEditingController = TextEditingController();

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  void _pushedButton(String number) {
    _textEditingController.text += number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Calculator',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 250,
              child: Flexible(
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
            const SizedBox(height: 20),
            ButtonItem(
              inputButton: (buttonName) {
                _pushedButton(buttonName);
              },
              buttonName1: buttons[12],
              buttonName2: buttons[13],
              buttonName3: buttons[14],
            ),
          ],
        ),
      ),
    );
  }
}
