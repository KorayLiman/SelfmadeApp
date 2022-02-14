import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smapp/constants.dart';
import 'package:swipe_deck/swipe_deck.dart';

class FlutterPage extends StatelessWidget {
  const FlutterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Arc(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(105, 61, 224, 1),
                  Color.fromRGBO(166, 78, 242, 1)
                ])),
                alignment: Alignment.center,
                child: Text(
                  "Flutter",
                  style: Constants.HeaderStyle,
                ),
                // color: Colors.blue.shade400,
                height: 100,
              )),
          SizedBox(
            height: 50,
          ),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 18,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      print("Tapped");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/comingsoon.jpg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(10),
                  ),
                );
              })
        ],
      ),
    );
  }
}
