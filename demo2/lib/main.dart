import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    title: "flutter bottomNavigationBar",
    //皮肤主体
    theme:ThemeData.light(),
    home: BottomNavgationWidget(),
   );
  }
}