import 'dart:io';

import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  CircleAvatar CurrentCA = CircleAvatar(
    backgroundColor: Colors.orange.shade300,
    child: const Text("KL"),
  );

  CircleAvatar OtherCA1 = CircleAvatar(
    backgroundColor: Colors.purple.shade300,
    child: const Text("KL"),
  );

  CircleAvatar OtherCA2 = CircleAvatar(
    backgroundColor: Colors.green.shade300,
    child: const Text("KL"),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Koray Liman"),
            accountEmail: Text("koraylimancre@gmail.com"),
            currentAccountPicture: GestureDetector(child: CurrentCA),
            otherAccountsPictures: [
              GestureDetector(
                child: OtherCA1,
                onTap: () {
                  setState(() {
                    var temp = CurrentCA;
                    CurrentCA = OtherCA1;
                    OtherCA1 = temp;
                  });
                },
              ),
              GestureDetector(
                child: OtherCA2,
                onTap: () {
                  setState(() {
                    var temp = CurrentCA;
                    CurrentCA = OtherCA2;
                    OtherCA2 = temp;
                  });
                },
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.settings),
                  title: const Text("Settings"),
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: const Text("Account"),
                ),
                ListTile(
                  onTap: () {
                    exit(0);
                  },
                  leading: Icon(Icons.exit_to_app),
                  title: const Text("Close App"),
                ),
                Divider(
                  thickness: 2,
                ),
                InkWell(
                  splashColor: Colors.cyan,
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.soap_outlined),
                    title: const Text("InkWell Test"),
                  ),
                ),
                AboutListTile(
                  child: Text("About"),
                  applicationName: "About",
                  applicationIcon: Icon(Icons.question_answer),
                  applicationVersion: "v1.0",
                  aboutBoxChildren: [
                    const Text("Hello1"),
                    const Text("Hello2"),
                    const Text("Hello3")
                  ],
                  icon: Icon(
                    Icons.question_answer,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
