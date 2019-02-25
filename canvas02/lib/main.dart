import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: Text("哈哈哈"),
         ),
         body: Container(
          child:CustomPaint(
            child: Text("哈哈"),
            painter: Draw(),
          ), 
          width: 100.0,
          height: 100.0,
         ),
       ),
    );
  }
}

 
class  Draw  extends CustomPainter{

Paint _paint;


@override
void paint(Canvas canvas, Size size) {
_paint=new Paint()
..color=Colors.red
  ..strokeCap = StrokeCap.butt
  ..style = PaintingStyle.stroke
  ..strokeWidth = 20.0
  ..isAntiAlias = false //是否启动抗锯齿
   ..maskFilter =
    MaskFilter.blur(BlurStyle.outer, 3.0);
    canvas.drawLine(Offset(50.0,10.0), Offset(50.0,100.0), _paint);


}
@override
bool shouldRepaint(CustomPainter oldDelegate) {

   return false;
}

}



