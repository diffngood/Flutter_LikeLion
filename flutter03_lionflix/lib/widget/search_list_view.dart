import 'package:flutter/material.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({super.key});

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => makeListItem(context),
    );
  }
}

// 리스트 뷰의 항목 하나를 구성하는 함수
Widget makeListItem(BuildContext context){

  return Container(
    padding: EdgeInsets.only(top: 10),
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          Image.asset(
            'lib/assets/images/movie4.jpg',
            width: 100,
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('영화제목1', style: TextStyle(fontSize: 15)),
              Text('출연진 : 배우1, 배우2, 배우3', style: TextStyle(fontSize: 12)),
              Text('제작진 : 제작1, 제작2', style: TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
    ),
  );
}