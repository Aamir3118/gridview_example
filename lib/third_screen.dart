import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  List index;
  //List list1;
  ThirdScreen({required this.index});
  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      children: List.generate(
        index.length,
        (idx) => Container(
          height: 70,
          width: 100,
          child: Image.asset(index[idx].toString()),
        ),
      ),
    ));
  }
}
