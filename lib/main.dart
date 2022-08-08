import 'package:flutter/material.dart';
import 'dart:math';

// Запуск основного виджета
void main() {
  runApp(Test());
}

// Так как мы меняем цвета фона в рантайме - нам нужен стейтфул виджет, так как он имеет возможность изменяться в рантайме
class Test extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// Переменная для сохранения рандомного значения цвета
Color _color = Colors.black;

class _MyAppState extends State<Test> {
  void generateColor() {
    setState(() {
      _color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  @override
  void initState() {
    generateColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => generateColor(),
        child: Container(
            alignment: Alignment.center, color: _color, child: CenterText()));
  }
}

class CenterText extends StatelessWidget {
  const CenterText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text("Hey there",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 60,
          fontFamily: "MouseMemoirs",
          letterSpacing: 5,
          color: Colors.black,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ));
  }
}
