# Flutter 중요 내용 정리

### 상태
- UI 요소의 속성에 적용되는 값들

### StatelessWidget
- 상태를 관리하는 요소가 없는 위젯
- 상태 관리를 하는 요소가 없기 때문에 눈에 보이는 UI요소에 대해 값을 지정하는 작업을 직접해줘야 한다.
- 비교적 구조가 간단하다.
- 눈에 보이는 요소를 위젯이 직접 관리한다.
- 어플 실행 후 종료 될 때까지 절대 변하는 부분이 없을 경우 사용한다.

### StatefulWidget
- 상태를 관리하는 요소가 있는 위젯
- 상태 관리 요소가 있기 때문에 상태 값을 변경시키는 것만으로 UI 요소에 변화를 줄 수 있다.
- 구조가 StatelessWidget 비해 조금 복잡하다.
- 눈에 보이는 요소를 상태 관리 요소가 관리한다.
- 어플 실행 후 종료 될 때까지 변하는 부분이 있는 경우 사용한다.

### Container
- 눈에 보이는 UI 요소들을 배치하는 요소
- Container는 배치되는 모양이나 기능에 따라 여러 가지가 제공된다.
- 안드로이드 네이티브에서 layout 에 해당하는 부분이다.

### Scaffold
- 눈에 보이는 화면의 전체적인 구조를 관리하는 요소이다.
- 상단 앱바, 하단 네비게이션바, 플로팅 버튼 등등을 설정할 수 있다.


---

# 프로젝트 설명

### 1. 프로젝트 기본 코드 작성

```dart
[main.dart]

import 'package:flutter/material.dart';

void main(){

}

// 애플리케이션 전체 클래스
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

### 2. MyApp 실행

```dart
[main.dart - main()]

// 애플리케이션 실행
runApp(const MyApp());
```

### 3. 상태 관리 객체의 build 메서드에 MaterialApp 설정

```dart
[main.dart - _MyAppState - build()]

// 여기서 반환하는 객체의 구성을 보고 화면을 만들어준다.
return MaterialApp(

);
```

### 4. 어플 타이틀과 테마 설정을 해준다.
```dart
[main.dart - _MyAppState - build()]

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
```

### 5. 눈에 보이는 화면을 구성하는 부분을 만들어준다.
```dart
[main.dart - _MyAppState - build()]

      home: Scaffold(

      ),
```
### 6. 상단 앱바를 구성해준다.
```dart
[main.dart - _MyAppState - build()]

// 상단 바
appBar: AppBar(
// 배경색
backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// 상단 바의 타이틀을 문자열 요소로 지정한다.
title : Text("멋쟁이 사자")
),
```

### 7. 화면 본문 부분을 작성해준다.
```dart
[main.dart - _MyAppState - build()]

// 화면 본문 부분
body : Center(

)
```
### 8. 화면 중앙에 문자열 요소 두 개를 배치해준다.
```dart
[main.dart - _MyAppState - build()]

// Column : 위에서 아래 방향으로 배치
// Row : 좌측에서 우측으로 배치
// Stack : 겹쳐서 배치한다.
child:  Column(
    // 화면 정 중앙으로 정렬한다.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text("첫 번째 Flutter 애플리케이션 입니다"),
        Text(
            "100",
            style: TextStyle(fontSize: 50),
        )
    ],
)
```

### 9. FloatingActionButton

```dart
[main.dart - _MyAppState - build()]

// FloatingActionButton
floatingActionButton: FloatingActionButton(
    // 버튼을 눌렀을 때
    onPressed: () {},
    // 버튼 내부에 보여줄 것
    child: Icon(Icons.add),
)
```

### 10. 숫자값을 담을 변수를 선언한다
```dart
[main.dart - _MyAppState]

// FloatingActionButton을 눌렀을 때 1씩 증가시킨 값을 담을 변수
int number = 0;
```

### 11. 두 번째 Text 요소 수정
- 문자열 값을 변수 출력으로 변경한다.
-  상단의 const는 삭제해준다.
-
```dart
Text(
    "$number",
    style: TextStyle(fontSize: 50),
) 
```

### 12. FloatingActionButton 이벤트
- 버튼을 눌렀을 때 변수의 값을 1 증가시킨다.
```dart
// 버튼을 눌렀을 때
onPressed: () {
    // setState 함수에서 변수의 값을 변경시키는 작업을 하게되면
    // 이 변수를 사용하는 모든 부분에 적용된다.
    setState(() {
        // number 변수 값을 증가시킨다.
        number++;
        });
},
```