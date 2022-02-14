import 'package:flutter/material.dart';
import 'package:smapp/constants.dart';

import '../modals/data.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late List<Data> AllDatas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AllDatas = [
      Data("Best Programming Language?", false, "Wut? Ofc C++"),
      Data("Best Game Engine?", false, "Unreal Engine"),
      Data("??????????", false, "Coming Soon"),
      Data("??????????", false, "Coming Soon"),
      Data("??????????", false, "Coming Soon"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ExpansionTile(key: PageStorageKey("$index"),
          initiallyExpanded: AllDatas[index].IsOpen,
          title: Text(
            AllDatas[index].Header,
            style: Constants.LessonCountStyle,
          ),
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                AllDatas[index].Content,
                style: Constants.HeaderStyle,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(58, 17, 55, 1),
                    Color.fromRGBO(23, 34, 75, 1)
                  ])),
              height: 150,
            )
          ],
        );
      },
    );
  }
}
