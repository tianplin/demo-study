// import 'package:flutter/material.dart';

//   void main()=>runApp(MyApp());
//   class MyApp extends StatelessWidget{

//    @override
//    Widget build(BuildContext content){
//    return MaterialApp(
//     title:'wiget-text',
//     home:Scaffold(
//    //  body:Center(
//       //   //----------------------文本练习
//       //   // child:new Text(
//       //   //   "我到底是什么傻逼东西啦啦啦啦啦奥绿啦啦啦啦啦啦啦绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿",
          
//       //   //  // textAlign: TextAlign.right,
//       //   //   maxLines: 1,
//       //   //   overflow: TextOverflow.ellipsis,
//       //   //   style: TextStyle(
//       //   //     fontSize: 25.0,
//       //   //     color: Color.fromARGB(255, 25, 158, 216),
//       //   //     decoration:TextDecoration.underline,
//       //   //     decorationStyle:TextDecorationStyle.solid,
//       //   //   ),
//       //   //   ),
//         // child:Container(
//         //   //child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
//         //   alignment: Alignment.topLeft,
//         //   width:500.0,
//         //   height:400.0,
//         //  // color: Colors.lightBlue,
//         //   padding: EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0),
//         //   margin: EdgeInsets.all(10.0),
//         //   decoration:new BoxDecoration(
//         //    border:Border.all(width:2.0,color:Colors.red)
//         //    ),
//         //    ),
//       //   //-------Image组件练习
//       //   // child: Container(
//       //   //  child: Image.network(
//       //   //    'http://pic30.nipic.com/20130605/7447430_160115320000_2.jpg',
//       //   //     scale:1.0,
//       //   //     //BoxFit.cover
//       //   //     fit: BoxFit.cover,
//       //   //  ),
//       //   //     width:300.0,
//       //   //     height:300.0,
//       //   //     color: Colors.lightBlue,
//       //   // ),
//       // ),
//       //------ listView组件的使用
//       // body: ListView(
//       //   children: <Widget>[
//       //     new ListTile(
//       //    leading:new Icon(Icons.access_time),
//       //     title:new Text('access_time') 
//       //     ),
//       //               new ListTile(
//       //    leading:new Icon(Icons.access_time),
//       //     title:new Text('access_time',
//       //     style: TextStyle(
//       //       fontSize: 30.0
//       //     ),) 

//--------------------------------------------------
//       //     ),
//       //     new ListTile(
//       //    leading:new Icon(Icons.access_time),
//       //     title:new Text('access_time') 
//       //     ),
//       //     new ListTile(
//       //    leading:new Icon(Icons.access_time),
//       //     title:new Text('access_time') 
//       //     )
//       //   ],
//       // ),
//       //====Row的使用
      // appBar:new AppBar(
      //       title:new Text('水平方向布局'),
      //     ),
      //   body:Row(
      //     children: <Widget>[
      //     Expanded(child:new RaisedButton(
      //           onPressed: (){         
      //           },
      //           color:Colors.redAccent,
      //           child:new Text('红色按钮')
      //         )),
      //         Expanded(child:new RaisedButton(
      //           onPressed: (){
      //             },
      //             color:Colors.orangeAccent,
      //             child: new Text('黄色按钮'),
      //           )
      //         ),
      //         Expanded(child:new RaisedButton(
      //           onPressed: (){
      //           },
      //           color:Colors.pinkAccent,
      //           child:new Text('粉色按钮')
      //         )             
      //         )
      //     ],
      //   )
//       //----Column的使用
//           appBar:new AppBar(
//             title:new Text('垂直方向布局'),
//           ),
//           //默认所有的组件都居中
          
//         body:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text('I am JSPang'),
//             Text('my website is jspang.com'),
//             Text('I love coding')
//           ],
//           )
//     )
//    );
//    }
//   }
//---------------------------------------------------导航-----------------------------------------------------------------------------
// import 'package:flutter/material.dart';

// void main(){

//  runApp(MaterialApp(
//  title:"导航演示",
//  home: new FirstScreen(),
//  ));
// }

// class FirstScreen extends StatelessWidget {
//   //重新写buid方法
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("导航页面"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text("查看商品详情页面"),
//           onPressed: (){
//             Navigator.push(context,MaterialPageRoute(
//               builder:(context)=>new SecondScreen()
//             ));
//           },
//         ),
//       ),
//     );
//   }
// }
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//        title:Text('商品详情页面'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text("放回"),
//          onPressed: (){
//            Navigator.pop(context);
//          },
//        ),
//      ),
//     );
//   }
// }
//---------------------------------------------传递参数---------------------------------------------------------
// import 'package:flutter/material.dart';

// class Product{

// final String title; //商品标题

// final String decription;//商品描述

// Product(this.title,this.decription);

// }

// void main(){
//   runApp(MaterialApp(
//      title:"导航的数据传递和接受",
//      home: ProductList(
//       products:List.generate(20, (i){
//        return  Product('商品$i',"这是一个商品详情页面 ，编号为$i");
//      })

//      ),
//   ));
// }
// class ProductList extends StatelessWidget {
//   final List<Product> products;
//   ProductList({Key key,@required this.products}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("商品列表")
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context,index){
//           return ListTile(
//             title: Text(products[index].title),
//             onTap: (){
//               // Navigator.push(context, MaterialPageRoute(
//               //  builder:(context)=>
//               //  ProductDetail(product:products[index])
//               // ));
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// class ProductDetail extends StatelessWidget {
//   final Product product;

//   ProductDetail({@required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//        title:Text("${product.title}"),
//      ),
//      body: Center(
//        child: Text('${product.decription}'),
//      ),
//     );
//   }
// }
//------------------------------------------------------------------
// import 'package:flutter/material.dart';
// void main(){
//   runApp(MaterialApp(
//   title: "页面跳转返回数据",
//   home:FirstPage() ,
//   ));
// }

// class FirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//        title: Text("xxxx"),
//      ),
//      body:Center(
//        child:RouteButton(),
//      ),
//     );
//   }
// }

// class Xiaojiejie extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//       title: Text("我是小姐姐"),
//     ),
//     body:Center(
//       child: Column(
//         children: <Widget>[
//           RaisedButton(
//             child: Text('大长腿小姐姐'),
//             onPressed: (){
//               Navigator.pop(context,'大长腿小姐姐：134534534534');
//             },
//           ),
//           RaisedButton(
//             child: Text('大屁股小姐姐'),
//             onPressed: (){
//               Navigator.pop(context,'大屁股小姐姐：123334444444444');
//             },
//           ),          
//         ],
//       ),
//     ) ,
//     );
//   }
// }

// class RouteButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: (){
//       _navigateXiaojiejie(context);
//       },
//       child: new Text("去找小姐姐"),
//     );
//   }
//   _navigateXiaojiejie(BuildContext context) async{
//     final resout=await Navigator.push(context, MaterialPageRoute(
//    builder: (context)=>Xiaojiejie()
//     ) );
//     print('$resout');
//        Scaffold.of(context).showSnackBar(SnackBar(content:Text('$resout')));
//   }
// }
