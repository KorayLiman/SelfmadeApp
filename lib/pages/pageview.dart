import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  var PController = PageController();
  bool IsHorizontal = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection:
                IsHorizontal == true ? Axis.horizontal : Axis.vertical,
            controller: PController,
            pageSnapping: true,
            onPageChanged: (index) => print("$index index"),
            children: [
              Container(
                color: Colors.purple,
                child: Column(
                  children: [
                    Center(
                      child: const Text("Page 0"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          PController.jumpToPage(2);
                        },
                        child: const Text("Second page"))
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: const Text("Page 1"),
                ),
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: const Text("Page 2"),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Horizontal"),
                  Checkbox(
                      value: IsHorizontal,
                      onChanged: (e) {
                        setState(() {
                          IsHorizontal = e!;
                        });
                      })
                ],
              )
            ],
          ),
          color: Colors.yellow,
        ))
      ],
    );
  }
}
