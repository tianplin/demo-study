import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/pages.dart';
import 'pages/email.dart';
import 'pages/airplay.dart';
//动态wiget

class BottomNavgationWidget extends StatefulWidget {
  _BottomNavgationWidgetState createState() => _BottomNavgationWidgetState();
}

class _BottomNavgationWidgetState extends State<BottomNavgationWidget> {

final _BottomNavigationColor=Colors.red;

int _currentIndex=0;

List<Widget>  list=List();

//重写初始化状态的方法
  @override
  void initState(){
    //..add代表list调用add方法并且是直接修改list  建造者模式
   list
       ..add(HomeScreen())
       ..add(EmailScreen())
       ..add(PagesScreen())
       ..add(AirplayScreen());
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: list[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
     type: BottomNavigationBarType.fixed,
     items: [
      //底部按钮组件
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: _BottomNavigationColor,
        ),
        title: Text(  
          "Home",
           style: TextStyle(color: _BottomNavigationColor),
        )
      ),
      //---------------------------
        BottomNavigationBarItem(
        icon: Icon(
          Icons.email,
          color: _BottomNavigationColor,
        ),
        title: Text(
          "Email",
          style: TextStyle(color: _BottomNavigationColor),
        )
      ),
     //---------------------------
      BottomNavigationBarItem(
        icon: Icon(
          Icons.pages,
          color: _BottomNavigationColor,
        ),
        title: Text(
          "Pages",
          style: TextStyle(color: _BottomNavigationColor),
        )
      ),
    //---------------------------
    BottomNavigationBarItem(
        icon: Icon(
          Icons.airplay,
          color: _BottomNavigationColor,
        ),
        title: Text(
          "Sirplay",
          style: TextStyle(color: _BottomNavigationColor),
        )
      )
    ],
    //会导入底部按钮点击的时候变大并且有一定的动画
    currentIndex: _currentIndex,
    onTap:(int index){
      setState(() {
          _currentIndex=index;
     });
    },
  ),
  );  


  }
}