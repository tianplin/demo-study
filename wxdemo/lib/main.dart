import 'package:flutter/material.dart';
import 'package:wxdemo/index.dart';
import 'package:wxdemo/share.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<MyApp> {



void initState() { 

   _initFluwx();
  super.initState();
  
}
  _initFluwx() async{
    await fluwx.register(appId: "wxd930ea5d5a258f4f", doOnAndroid: true, doOnIOS: true, enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }

    // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "穷游",
      theme: ThemeData(
     primaryColor: Color.fromARGB(255, 48, 175, 213),
    accentColor: Colors.cyan[600],
      ),
      //引入主页面
      home: LaunchMiniProgramPage()
    );
  }
}