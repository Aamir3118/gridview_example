import 'package:first_app/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController num_controller = TextEditingController();
  //Map map = {};

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    void increamentCounter() {
      setState(() {
        if (counter == 8) {
          counter = 1;
        } else {
          counter = counter + 1;
        }
      });
    }

    List<Map> images = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                keyboardType: TextInputType.number, controller: num_controller),
            ElevatedButton(
                onPressed: () {
                  for (var j = 0; j < int.parse(num_controller.text); j++) {
                    images.add({
                      "name": "assets/images/bg-$counter.jpg",
                      "isChecked": false
                    });
                    increamentCounter();
                  }

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => SecondScreen(
                            i: int.parse(num_controller.text),
                            imgList: images,
                          ))));

                  // print(_userChecked);
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
