import 'package:flutter/material.dart';

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  final TextEditingController _textEditingController = TextEditingController();

  void _insertOne(String number) {
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _insertOne('1');
                  },
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _insertOne('2');
                  },
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('3'),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('6'),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('9'),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('='),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
