import 'dart:io';
import 'dart:ui';

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smapp/constants.dart';
import 'package:smapp/database.dart';
import 'package:smapp/drawer.dart';
import 'package:smapp/main.dart';
import 'package:smapp/pages/blogpage.dart';
import 'package:smapp/pages/cpp.dart';
import 'package:smapp/pages/dartpage.dart';
import 'package:smapp/pages/flutterpage.dart';
import 'package:smapp/pages/pageview.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _SelectedIndex = 0;

  late List<Widget> AllPages;

  late BlogPage BP;
  late TBView TB;
  late PageViewExample PV;
  var KeyHomePage = PageStorageKey("Key_Homepage");
  var KeyFAQPage = PageStorageKey("FAQ_Page");
  var KeyPV = PageStorageKey("PV_Page");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BP = BlogPage(
      key: KeyFAQPage,
    );
    TB = TBView(
      key: KeyHomePage,
    );
    PV = PageViewExample(key: KeyPV,);
    AllPages = [TB, BP, PV];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotNavBar(),
      drawer: DrawerMenu(),
      //backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        bottom: TabBar(
            overlayColor: MaterialStateProperty.all(Colors.yellow),
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              //Tab(child: Text("qwe", style: TextStyle(fontFamily: "TestFont"),),)
              Tab(
                child: Text(
                  "C++",
                  style: Constants.HeaderStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Dart",
                  style: Constants.HeaderStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Flutter",
                  style: Constants.HeaderStyle,
                ),
              ),
            ]),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.dark_mode),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
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
      body: AllPages[_SelectedIndex],
    );
  }

  Container BotNavBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(77, 11, 53, 1),
            Color.fromRGBO(188, 19, 51, 1)
          ])),
      child: BottomNavigationBar(
          currentIndex: _SelectedIndex,
          onTap: (index) {
            setState(() {
              _SelectedIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.green.shade800,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.question_answer,
              ),
              label: "FAQ",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.pages), label: "PageView")
          ]),
    );
  }
}

class TBView extends StatelessWidget {
  const TBView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: [CppPage(), DartPage(), FlutterPage()],
        physics: NeverScrollableScrollPhysics());
  }
}

// SingleChildScrollView(
//         child: Column(
//           children: [
//             Arc(
//                 height: 20,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(colors: [
//                     Color.fromRGBO(105, 61, 224, 1),
//                     Color.fromRGBO(166, 78, 242, 1)
//                   ])),
//                   alignment: Alignment.center,
//                   child: Text(
//                     "C++, Dart, Flutter",
//                     style: Constants.HeaderStyle,
//                   ),
//                   // color: Colors.blue.shade400,
//                   height: 100,
//                 )),
//             ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 14,
//               itemBuilder: (context, index) {
//                 return Card(
//                   color: Colors.grey.shade300,
//                   elevation: 16,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16)),
//                   child: ListTile(
//                     title: Text(Topics.keys.elementAt(index)),
//                     subtitle: Text(Topics.keys.elementAt(index)),
//                     trailing: Icon(Icons.arrow_forward_ios),
//                     leading: Image.asset(
//                       "assets/images/cpp.jpg",
//                       height: 48,
//                       width: 48,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       )