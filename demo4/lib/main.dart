//酷炫导航动画
import 'package:flutter/material.dart';
import 'pages.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
   title: "FLutter demo",
   //自定义主题样本
   theme: ThemeData(
     primarySwatch: Colors.blue
   ),
   home: FirstPage(),
   );
  }
}