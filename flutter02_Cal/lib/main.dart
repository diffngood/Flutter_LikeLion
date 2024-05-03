import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(const CalApp());
}

class CalApp extends StatefulWidget{
  const CalApp({super.key});

  @override
  State<CalApp> createState() => _CalAppState();
}

class _CalAppState extends State<CalApp>{

  // 제일 하단에 결과가 나오는 Text 요소의 문자열을 가지고 있는 변수
  var result_text = "결과 : 0";

  // 첫 번째 숫자 입력 요소의 컨트롤러
  var number1_controller = TextEditingController();
  // 두 번째 숫자 입력 요소의 컨틀롤러
  var number2_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "4칙 연산 계산기",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("사칙연산 계산기"),
        ),
        body: Container(
          // 내부 여백을 설정한다.
          padding: EdgeInsets.all(10),
          // 위에서 아래로 배치하는 레이아웃 요소를 설정한다.
          child: Column(
            children: [
              // 첫 번째 입력 요소를 배치한다.
              TextField(
                // 입력 요소의 모양을 설정한다.
                decoration: InputDecoration(
                  // 외곽선 모양
                  border: OutlineInputBorder(),
                  // hint
                  labelText: "첫 번째 숫자",
                ),
                // 입력가능한 데이터 양식
                inputFormatters: [
                  // 숫자만 입력 가능하게..
                  FilteringTextInputFormatter.digitsOnly,
                ],
                // 나타나는 키보드 타입 설정, 숫자 키보드
                keyboardType: TextInputType.number,
                // 포커스를 준다.
                autofocus: true,
                // 컨트롤러를 연결해준다.
                controller: number1_controller,
              ),

              // 위젯의 여백을 설정할 수 있는 Padding 요소를 사용한다.
              Padding(
                padding: EdgeInsets.only(top: 10),
                // 두 번째 입력 요소를 배치한다.
                child: TextField(
                  // 입력 요소의 모양을 설정한다.
                  decoration: InputDecoration(
                    // 외곽선 모양
                    border: OutlineInputBorder(),
                    // hint
                    labelText: "두 번째 숫자",
                  ),
                  // 입력가능한 데이터 양식
                  inputFormatters: [
                    // 숫자만 입력 가능하게..
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // 나타나는 키보드 타입 설정, 숫자 키보드
                  keyboardType: TextInputType.number,
                  // 컨트롤러를 연결해준다.
                  controller: number2_controller,
                ),
              ),

              // 버튼을 배치하기 위한 Row를 배치한다.
              // ( +, - ) 버튼
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    // 더하기 버튼
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setResult('+'),
                        child: const Text("+")
                      ),
                      // flex로 비율을 지정 할 수 있다
                      // flex: 3,
                    ),
                    SizedBox(width: 10,),
                    // 빼기 버튼
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setResult('-'),
                        child: const Text("-")
                      ),
                    ),
                  ],
                ),
              ),

              // ( *, / ) 버튼
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    // 곱하기 버튼
                    Expanded(child:
                      OutlinedButton(
                          onPressed: () => setResult('*'),
                          child: const Text("*")
                      ),
                    ),
                    Container(width: 10,),
                    // 나누기 버튼
                    Expanded(child:
                      OutlinedButton(
                          onPressed: () => setResult('/'),
                          child: const Text("/")
                      ),
                    ),
                  ],
                ),
              ),

              // 출력 결과를 출력할 텍스트 요소
              Padding(
                padding: EdgeInsets.only(top: 20),
                  child: Text(
                    result_text,
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
              ),

            ],
          ),
        ), // body, Container

      ),
    );
  }

  // 연산 후 출력하는 함수
  void setResult(String op) {
    setState(() {
      // 입력한 값을 가져온다
      int number1 = int.parse(number1_controller.text);
      int number2 = int.parse(number2_controller.text);

      // 연산자에 따라 연산 결과를 출력해준다.
      switch(op){
        case '+':
          result_text = '결과 : ${number1 + number2}';
        case '-':
          result_text = '결과 : ${number1 - number2}';
        case '*':
          result_text = '결과 : ${number1 * number2}';
        case '/':
          if(number1 == 0 || number2 == 0){
            result_text = '결과 : 0';
          } else {
            result_text = '결과 : ${number1 / number2}';
          }
      }
    });
  }
}

