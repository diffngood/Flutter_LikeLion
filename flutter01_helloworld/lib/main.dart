import 'package:flutter/material.dart';

void main(){
  // 애플리케이션 실행
  runApp(const MyApp());
}

// 애플리케이션 전체 클래스
// StatefulWidget을 상속 받았다.
// State를 관리하는 객체를 통해 화면 UI 요소들을 관리하도록 한다.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // 상태를 관리하는 클래스의 객체를 생성하여 반환한다.
  // createState 메서드는 dart vm에 의해 자동 호출되고
  // 여기서 반환하는 상태관리 객체를 이용해 화면을 구성해서 보여준다.
  @override
  State<MyApp> createState() => _MyAppState();
}

// 상태를 관리하는 객체의 클래스
// State를 상속받는다.
class _MyAppState extends State<MyApp> {

  // FloatingActionButton을 눌렀을 때 1씩 증가시킨 값을 담을 변수
  var number = 0;

  // 눈에 보이는 부분을 구성하는 메서드
  // dart vm은 이 메서드를 호출하고 이 메서드가 반환하는
  // 객체의 구성을 보고 화면을 만들어준다.
  // 전체를 항상 다시 갱신하는 것이 아닌 상태가 변화된 UI 요소만
  // 새롭게 갱신하여 화면 갱신에 대한 속도를 빠르게 처리한다.
  @override
  Widget build(BuildContext context) {
    // 여기서 반환하는 객체의 구성을 보고 화면을 만들어준다.
    return MaterialApp(
      // 어플의 타이틀
      // 앱바를 따로 설정하지 않으면 title 문자열이 보여진다.
      title: '멋쟁이 사자',
      // 테마
      // 어플 전체에 적용될 테마
      theme: ThemeData(
        // 컬러 시스템 설정
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // Material 3 를 적용할 것인지...
          useMaterial3: true
      ),
      // 눈에 보이는 화면을 구성하는 부분
      home: Scaffold(
        // 상단 바
        appBar: AppBar(
          // 배경색
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            // 상단 바의 타이틀을 문자열 요소로 지정한다.
            title : Text("멋쟁이 사자")
        ),
        // 화면 본문 부분
        // Center : 배치될 UI 요소들을 중앙에 정렬하는 컨테이너
        body : Center(
          // Column : 위에서 아래 방향으로 배치
          // Row : 좌측에서 우측으로 배치
          // Stack : 겹쳐서 배치한다.
          child:  Column(
            // 화면 정 중앙으로 정렬한다.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("첫 번째 Flutter 애플리케이션 입니다"),
              Text(
                "$number",
                style: TextStyle(fontSize: 50),
              )
            ],
          ),
        ),
        // FloatingActionButton
        floatingActionButton: FloatingActionButton(
          // 버튼을 눌렀을 때
          onPressed: () {
            // setState 함수에서 변수의 값을 변경시키는 작업을 하게되면
            // 이 변수를 사용하는 모든 부분에 적용된다.
            setState(() {
              // number 변수 값을 증가시킨다.
              number++;
            });
          },
          // 버튼 내부에 보여줄 것
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}