import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../database.dart';

class CppPage extends StatelessWidget {
  const CppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  "C++",
                  style: Constants.HeaderStyle,
                ),
                // color: Colors.blue.shade400,
                height: 100,
              )),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 14,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey.shade300,
                elevation: 16,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(105, 61, 224, 1),
                        Color.fromRGBO(166, 78, 242, 1)
                      ])),
                  child: ListTile(
                    shape: RoundedRectangleBorder(),
                    title: Text(Topics.keys.elementAt(index)),
                    subtitle: Text(Topics.keys.elementAt(index)),
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/cpp.jpg",
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
