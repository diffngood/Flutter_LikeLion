# Flutter 종합 예제

---

1. 코드 삭제
- lib/main.dart
- test/widget_test.dart

### materialApp 기본 구조 작성하기

1. StatefulWidget 을 작성해준다.

```dart
[mian.dart]

import 'package:flutter/material.dart';

class LionFlixApp extends StatefulWidget {
  const LionFlixApp({super.key});

  @override
  State<LionFlixApp> createState() => _LionFlixAppState();
}

class _LionFlixAppState extends State<LionFlixApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

```

2. main 함수를 작성해준다.

```dart
[mian.dart]

void main(){
  runApp(LionFlixApp());
}
```

3. MaterialApp의 기본 테마를 설정해준다.

```dart
[mian.dart - _LionFlixAppState - build()]

    return MaterialApp(
      title : 'LionFlix',
      theme : ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            // 전체적인 어플의 테마를 어두운 테마로 설정한다.
            brightness: Brightness.dark
        ),
        useMaterial3: true
      ),
      home: Center(child: Text('안녕하세요'))
    );

```

### BottomNavigationBar를 배치한다.

1. home을 Scaffold 구조로 설정해준다.

```dart
[mian.dart - _LionFlixAppState - build()]

      home: Scaffold(
        
      )
```

2. widget 폴더를 만들어준다.

lib/widget

3. widget 폴더에 dart 파일을 생성해준다.

lib/widget/main_bottom_navigation_bar.dart

4. StatefulWidget으로 작성해준다.

```dart
[main_bottom_navigation_bar.dart]

import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() => _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

```

5. 네비게이션 바를 작성해준다.

```dart
[main_bottom_navigation_bar.dart - _MainBottomNavigationBarState - build()]

    // 하단에 배치될 네비게이션 바
    return NavigationBar(
        // 네비게이션 바를 구성하는 아이콘들
        destinations: [
          
        ]
    );
```

6. main.dart에 bottomNavigationBar를 설정해준다.

```dart
[main.dart - _LionFlixAppState - build()]

        bottomNavigationBar: MainBottomNavigationBar(),
```

7. destinations 안에 4개의 아이콘 메뉴를 배치한다.

```dart
[main_bottom_navigation_bar.dart - _MainBottomNavigationBarState - build()]

          NavigationDestination(
              // 평상시의 아이콘
              icon: Icon(Icons.home_outlined),
              // 눌러졌을 때의 아이콘
              selectedIcon: Icon(Icons.home),
              // 아이콘 하단에 표시될 문자열
              label: "Home"
          ),
          NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: "Search"
          ),
          NavigationDestination(
              icon: Icon(Icons.save_alt_outlined),
              selectedIcon: Icon(Icons.save_alt),
              label: "saved"
          ),
          NavigationDestination(
              icon: Icon(Icons.list_outlined),
              selectedIcon: Icon(Icons.list),
              label: "more"
          )
```

8. 하단 아이콘 메뉴 중 선택되어 있는 아이콘 메뉴의 순서값을 담을 변수를 선언해준다.

```dart
[main_bottom_navigation_bar.dart - _MainBottomNavigationBarState]

  // 네비게이션 바에서 선택되어 있는 아이콘 메뉴의 순서값
  int tabPageIndex = 0;

```

9. 하단 아이콘 메뉴 중 어떤 것을 선택할 지 작성해준다.

```dart

[main_bottom_navigation_bar.dart - _MainBottomNavigationBarState - build()]

        // 네비게이션 바에 배치된 아이콘 메뉴들 중 어떤 것을 선택할 것인가..
        selectedIndex: tabPageIndex,

```
10. 탭 메뉴를 눌렀을 때의 리스너를 구현해준다

```dart

[main_bottom_navigation_bar.dart - _MainBottomNavigationBarState - build()]

        // 하단 메뉴를 눌렀을 때
        // value : 사용자가 누른 메뉴 항목의 순서값
        onDestinationSelected: (value) {
          setState(() {
            tabPageIndex = value;
          });
        },
```

11. 인디케이터 색상을 설정해준다.
```dart
[main_bottom_navigation_bar.dart - _MainBottomNavigationBarState - build()]

        // indicator 색상
        indicatorColor: Colors.white12,
```

### 첫 화면을 구성한다.
- 네비게이션바 상단에 배치가 되며 본문 부분이 된다.
- 네비게이션바의 메뉴를 누르면 이 화면 안에서 화면들이 변경되게 한다.


1. 화면 파일들을 작성할 폴더를 생성한다.

lib/screen

2. screen 폴더에 첫 화면 파일을 생성한다.

lib/screen/main_screen.dart


3. StatefulWidget 으로 작성해준다.

```dart
[main_screen.dart]

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

```

4. main.dart 에 MainScreen을 설정해준다.


```dart
[main.dart - _LionFlixAppState - build()]

body: MainScreen(),

```

### provider 라이브러리 셋팅
- 사용자가 네비게이션 아이콘 메뉴를 누르면 화면이 변경되도록 할 것이다.
- 네비게이션 바는 main_bottom_navigation_bar.dart에 구현되어 있고 화면은 main_screen.dart에 구현되어 있다.
- 파일이 서로 다르기 때문에 상태 관리 객체도 각각 따로 존재하는 상황이다.
- 물론 모두 하나의 파일에서 작업을 하면 간단하지만 우리는 파일을 나눠서 작업하는 예를 실습하고 있다.
- 상태 관리 객체는 다른 상태 관리 객체에 관여할 수 없다.
- 이럴 경우 글로벌 상태를 사용을 하면 쉽게 처리가 가능하다.
- provider 라이브러리를 사용하면 간단하게 처리가 가능하다...

1. https://pub.dev/ 사이트에 들어간다.
2. provider로 검색하여 라이브러리 페이지로 들어간다.
3. provider 라이브러리 설치 문자열을 복사한다(provider: ^6.1.2)
4. 프로젝트에 있는 pubspec.yaml 파일을 열어준다.
5. dependencies: 로 검색하여 위치를 찾아준다.
6. dependencies: 안에 라이브러리 설치 문자열을 입력해준다.
7. Pug get을 눌러준다.

8. provider 폴더를 만들어준다.

- lib/provider

9. provider 폴더안에 tab_page_index_provider.dart 파일을 만들어준다.

- lib/provider/tab_page_index_provider.dart

10. TabPageIndexProvider를 사용하는 코드로 변경한다.

11. main_bottom_navigation_bar.dart 파일을 수정한다.

- tagPageIndex 변수 선언 부분을 제거한다.
```dart
[main_bottom_navigation_bar.dart - _MainBottomNavigationBarState]

  // 네비게이션 바에서 선택되어 있는 아이콘 메뉴의 순서값
  // int tabPageIndex = 0;
```


