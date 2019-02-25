import 'package:flutter/material.dart';
import 'package:demo1/entity/poetry.dart';

import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'package:demo1/httpUtil.dart';

// void main() => runApp(new HomePage());

// class HomePage  extends StatefulWidget {
//   ListState createState() => ListState();
// }

// class ListState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//        return MaterialApp(
//          title: '测试界面',
//          home: new Scaffold(
//          appBar: new AppBar(
//            title: new Text("flutter App")
//          ),
//          body: new ListView.builder(
//            itemCount: 20,
//            itemBuilder: buildItem,
//          ),
//          ),
//        );
//   }
//   //Listview 的Item
//   Widget buildItem(BuildContext context,int index){
//     if(index.isOdd){
//      return new Divider();
//     }
//     TextStyle textStyle=new TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 14.0
//     );
//     _openSimpleDialog(){
//     showDialog(
//       context: context,
//       builder: (BuildContext context){
//         return SimpleDialog(
//           title: Text("simpleDialog"),
//           children: <Widget>[
//           new Text("哈哈哈"),
//           new Text("哈哈哈"),
//           new Text("哈哈哈")
//           ],
//         );
//       }
//     );
//   }
//     return new GestureDetector(
//      onTap: (){
//        //处理点击事件
//    _openSimpleDialog();
//      },
//      child: new Container(
//         padding: const EdgeInsets.all(8.0),
//         child: new Text("xhu_ww", style: textStyle),
//       ),
//     );
//   }

// }
///------------------请求-----------------------------
///

void main() => runApp(new HomePage());


class HomePage  extends StatefulWidget {
  ListState createState() => ListState();
}

class ListState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
         title: '测试界面',
         home: new Scaffold(
         appBar: new AppBar(
           title: new Text("flutter App"),
           backgroundColor: Color.fromARGB(255, 165, 31, 31),
         ),
         body: new ListView.builder(
           itemCount: 20,
           itemBuilder: buildItem,
         ),
         ),
       );
  }
  //Listview 的Item
  Widget buildItem(BuildContext context,int index){
    if(index.isOdd){
     return new Divider();
    }
    TextStyle textStyle=new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0
    );
    _openSimpleDialog ()async{
      print("哈哈哈");
    var response=await HttpUtil().get('', {});
    // print(response);
    poetry poetry1=poetry(response);
    print(poetry1.result.authors);
    
    Text author=new Text("${response['result']['author']}");
    Text origin=new Text("${response['result']['origin']}");
    Text category=new Text("${response['result']['category']}");
    Text content=new Text("${response['result']['content']}");
   showDialog(
      context: context,
      builder: (BuildContext context){
        return new SimpleDialog(
          title: author,
          titlePadding: EdgeInsets.fromLTRB(100.0,0.0, 60.0,0.0),
          children: <Widget>[
           Container( 
             width: 500.0,
             height: 500.0,
             child:content,
             decoration:new BoxDecoration(
               color: Colors.lightBlue,
               border: Border( 
                 top: BorderSide(
                   
                 )
               )
             ),
           ),
           Container(),
           Container(),
          ],
        );
      }
    );   



  }

  return new GestureDetector(
     onTap: (){
       //处理点击事件
     _openSimpleDialog();
     },
     child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Text("xhu_ww", style: textStyle),
      ),
    );
  }

}
