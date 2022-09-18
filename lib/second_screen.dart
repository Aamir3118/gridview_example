import 'package:first_app/third_screen.dart';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  //const Detail({Key? key}) : super(key: key);
  //static ValueNotifier<int> enteredValue = ValueNotifier(0);
  int i;
  List<Map> imgList;
  List<dynamic> result = [];

  SecondScreen({required this.i, required this.imgList});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    print(widget.imgList);
    print("Selected :$widget.result");
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ThirdScreen(
                      index: widget.result,
                    )));
          },
          child: Text("Submit"),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: GridView.count(
          physics: ScrollPhysics(),
          crossAxisCount: 3,
          shrinkWrap: true,
          mainAxisSpacing: 3,
          crossAxisSpacing: 5,
          children: List.generate(
            widget.imgList.length,
            (index) => Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(widget.imgList[index]["name"])),
                Checkbox(
                    value: widget.imgList[index]["isChecked"],
                    onChanged: (val) {
                      setState(() {
                        widget.imgList[index]["isChecked"] = val;
                        if (widget.imgList[index]["isChecked"] == true) {
                          widget.result.add(widget.imgList[index]["name"]);
                        } else {
                          widget.result.remove(widget.imgList[index]["name"]);
                        }
                      });
                    })
              ],
            ),
          ),
        ))));
  }
}
