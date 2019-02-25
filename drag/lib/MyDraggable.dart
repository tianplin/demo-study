
import 'package:flutter/material.dart';


class MyDraggable extends StatelessWidget {

  final data;
   MyDraggable({this.data = "MyDraggable", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
    data: data,
    feedback: Container(
        width: 150.0,
        height: 150.0,
        color: Colors.blue[500],
        child: Icon(Icons.feedback)
    ),
    child: Container(
      width: 150,
      height: 150,
      color: Colors.redAccent,
      
      child: Center(
        child: Text("Draggable"),
      ),
      
    ),

    );
  }
}