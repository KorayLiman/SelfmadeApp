import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smapp/constants.dart';
import 'package:smapp/database.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.dark_mode),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(16),
        //         bottomRight: Radius.circular(16))),
        backgroundColor: Colors.blue.shade400.withOpacity(0.8),
        title: Center(
            child: Text(
          "Koray Liman",
          textAlign: TextAlign.center,
          style: Constants.HeaderStyle,
        )),
      ),
      body: SingleChildScrollView(
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
                    "C++, Dart, Flutter",
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
                  child: ListTile(
                    title: Text(Topics.keys.elementAt(index)),
                    subtitle: Text(Topics.keys.elementAt(index)),
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
