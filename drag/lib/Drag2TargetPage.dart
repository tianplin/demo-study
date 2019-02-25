
import 'package:flutter/material.dart';

class MyDragTarget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDragTargetState();
}
class _MyDragTargetState extends State<MyDragTarget> {
  var targetText = "Target";//用于显示的文案
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        print("data = $data onWillAccept");
        return data != null;//当Draggable传递过来的dada不是null的时候 决定接收该数据。
      },
      onAccept: (data) {
        print("data = $data onAccept");
        setState(() {
          targetText = data;//接收该数据后修改文案内容。
        });
      },
      onLeave: (data) {
        print("data = $data onLeave");//我来了 我又走了
      },
      builder: (context, candidateData, rejectedData) {
        //这是DragTarget实际展示给用户看到的样子
        return Container(
          width: 150.0,
          height: 150.0,
          color: Colors.blue[500],
          child: Center(
            child: Text(targetText),
          ),
        );
      },
    );
  }
}