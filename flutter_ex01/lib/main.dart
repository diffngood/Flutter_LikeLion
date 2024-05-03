import 'package:flutter/material.dart';

void main() {
  // 애플리케이션 실행
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorApp(),
    );
  }
}

// 애플리케이션 전체 클래스
// StatefulWidget을 상속 받았다.
// State를 관리하는 객체를 통해 화면 UI 요소들을 관리하도록 한다.
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  // 상태를 관리하는 클래스의 객체를 생성하여 반환한다.
  // createState 메서드는 dart vm에 의해 자동 호출되고
  // 여기서 반환하는 상태관리 객체를 이용해 화면을 구성해서 보여준다.
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  double result = 0;

  void calculateResult(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            result = 0; // 0으로 나눌 경우 결과는 0으로 설정
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number 1'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number 2'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => calculateResult('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}