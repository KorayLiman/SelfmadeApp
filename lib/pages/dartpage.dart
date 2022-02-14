import 'package:flutter/material.dart';
import 'package:smapp/constants.dart';
import 'package:swipe_deck/swipe_deck.dart';

class DartPage extends StatelessWidget {
  const DartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwipeDeck(
      startIndex: 2,
      widgets: Constants.IMAGES
          .map((e) => GestureDetector(
                onTap: () => print(e),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/$e.jpg"),
                            fit: BoxFit.fill)),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
