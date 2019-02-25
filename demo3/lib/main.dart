import 'package:flutter/material.dart';
import 'bottom_appBar_demo.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
   title: "Flutter Demo",
   //自定义主题样本
   theme:ThemeData(
     //颜色
     primarySwatch: Colors.red,
   ),
   home: BottomAppBarDemo(),
 );
  }
}