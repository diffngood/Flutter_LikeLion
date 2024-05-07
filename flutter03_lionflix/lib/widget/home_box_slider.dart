import 'package:flutter/material.dart';
import 'package:flutter03_lionflix/screen/detail_screen.dart';

class HomeBoxSlider extends StatefulWidget {
  const HomeBoxSlider({super.key});

  @override
  State<HomeBoxSlider> createState() => _HomeBoxSliderState();
}

class _HomeBoxSliderState extends State<HomeBoxSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("지금 뜨는 콘텐츠"),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return makeListItem(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

// 리스트 뷰의 항목 하나를 구성하는 함수
Widget makeListItem(BuildContext context){

  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailScreen(),
          fullscreenDialog: true
        )
      );
    },
    child: Container(
      padding: EdgeInsets.only(right: 12),
      child: Image.asset('lib/assets/images/movie8.jpg'),
    ),
  );
}