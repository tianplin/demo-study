import 'package:flutter/material.dart';
import 'keep_alive_demo.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       primarySwatch: Colors.lightBlue,
     ),
     home: KeepAliveDemo(),
   );
  }
}

class KeepAliveDemo extends StatefulWidget {
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>  with SingleTickerProviderStateMixin{

TabController _controller;

@override
  void initState() {
    // TODO: implement initState
   _controller=TabController(
     length: 3,    //需要控制的Tab页数量
     vsync: this  //动画效果的异步处理，默认格式，背下来即可
     );
    super.initState();
  }

//销毁的方法
@override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('keepAliveDemo'),
         bottom: TabBar(
           controller: _controller,
           tabs:[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
           ],
         ),
       ),
       body: TabBarView(
         controller: _controller,
         children: <Widget>[
          MyHomePage(),
          MyHomePage(),
          MyHomePage()
         ],
       ),
     );
  }
}