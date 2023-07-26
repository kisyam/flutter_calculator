import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  final String buttonName1;
  final String buttonName2;
  final String buttonName3;
  final void Function(String buttonName) inputButton;

  const ButtonItem({
    super.key,
    required this.inputButton,
    required this.buttonName1,
    required this.buttonName2,
    required this.buttonName3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            inputButton(buttonName1);
          },
          child: Text(buttonName1),
        ),
        ElevatedButton(
          onPressed: () {
            inputButton(buttonName2);
          },
          child: Text(buttonName2),
        ),
        ElevatedButton(
          onPressed: () {
            inputButton(buttonName3);
          },
          child: Text(buttonName3),
        ),
      ],
    );
  }
}
