
import 'package:flutter/material.dart';
import 'MyDraggable.dart';
import 'Drag2TargetPage.dart';
main(){
 runApp(MyApp());
}


class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("drag"),
        ),
        body: Row(
          children: <Widget>[
            MyDraggable(data: '哈哈',),
            MyDragTarget()
          ],
        ),
      ),
    );
  }
}