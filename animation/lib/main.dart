//flutter 动画官方实例学习
/**
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp>  with SingleTickerProviderStateMixin{

Animation<double> animation;
//AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值
AnimationController controller;

@override
void initState() { 
  super.initState();
  //当创建一个AnimationController时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画（译者语：动画的UI不在当前屏幕时）消耗不必要的资源。
 // 通过将SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值。你可以在GitHub的animate1中看到这个例子 。
  controller=new AnimationController(
      duration: const Duration(milliseconds: 2000), vsync: this
   );
  //默认情况下，AnimationController对象的范围从0.0到1.0。
  //如果您需要不同的范围或不同的数据类型，则可以使用Tween来配置动画以生成不同的范围或数据类型的值。

   animation=new Tween(begin: 0.0,end: 300.0).animate(controller)
   ..addListener((){
      setState(() {
        
      });

   });
   controller.forward();
}

  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
}

void main() {
  runApp(new LogoApp());
}
**/
//-----------------second----------------------------------------
// Demonstrate a simple animation with AnimatedWidget

// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';

// class AnimatedLogo extends AnimatedWidget {

//   AnimatedLogo({Key key, Animation<double> animation})
//       : super(key: key, listenable: animation);

//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return new Center(
//       child: new Container(
//         margin: new EdgeInsets.symmetric(vertical: 10.0),
//         height: animation.value,
//         width: animation.value,
//         child: new Container(
//           height: 300.0,
//           width: 400.0,
//           decoration: BoxDecoration(
//             border: Border.all(
//               width: 2.0,
//               color: Colors.red
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LogoApp extends StatefulWidget {
//   _LogoAppState createState() => new _LogoAppState();
// }

// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> animation;

//   initState() {
//     super.initState();
//     controller = new AnimationController(
//         duration: const Duration(milliseconds: 6000), vsync: this);
//         final curve=CurvedAnimation(parent: controller,curve:Curves.easeOut);

//         animation = new Tween(begin: 50.0, end: 300.0).animate(curve)
//        //使用addStatusListener来处理动画状态更改的通知，例如启动、停止或反转方向
//       //当动画完成或返回其开始状态时，通过反转方向来无限循环运行动画
//       //..addStatusListener((state) => print("$state"));
//       ..addListener((){
//           setState(() {
//             print(animation.value);
    
//           });
//       })
//      ..addStatusListener((state){

//      // print(animation);
//      //print(animation.value);


//      });
//      //启动动画
//     controller.forward();
//   }

//   Widget build(BuildContext context) {
//     return new AnimatedLogo(animation: animation);
//   }

//   dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// void main() {
//   runApp(new LogoApp());
// }

//-------------------animation-builder-------------------------------

// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';
// class LogoWidget extends StatelessWidget {
//   // Leave out the height and width so it fills the animating parent
//   build(BuildContext context) {
//     return new Container(
//       margin: new EdgeInsets.symmetric(vertical: 10.0),
//       child: new FlutterLogo(),
//     );
//   }
// }

// class GrowTransition extends StatelessWidget {

//   GrowTransition({this.child, this.animation});
  
//   final Widget child;
//   final Animation<double> animation;

//   Widget build(BuildContext context) {
//     return new Center(
//       child: new AnimatedBuilder(
//           animation: animation,
//           builder: (BuildContext context, Widget child) {
//             return new Container(
//                height: animation.value, width: animation.value, child: child);
//           },
//           child: child),
//     );
//   }
// }

// class LogoApp extends StatefulWidget {
//   _LogoAppState createState() => new _LogoAppState();
// }

// class _LogoAppState extends State<LogoApp> with TickerProviderStateMixin {
//   Animation animation;
//   AnimationController controller;

//   initState() {
//     super.initState();
//     controller = new AnimationController(
//         duration: const Duration(milliseconds: 5000), vsync: this);
//     final CurvedAnimation curve =
//         new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
//     CurvedAnimation包装它正在修改的对象 - 您不需要子类AnimationController来实现曲线
//     animation = new Tween(begin: 0.0, end: 400.0).animate(curve)
//     ..addStatusListener((state){
//      if(state==AnimationStatus.completed)
//      {
//        controller.reverse();
//        //dismissed 解散的
//      } else if(state==AnimationStatus.dismissed){
//         controller.forward();
//      };
//     });

//     controller.forward();

//   }

//   Widget build(BuildContext context) {
//     return new GrowTransition(child: new LogoWidget(), animation: animation);
//   }

//   dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// void main() {
//   runApp(new LogoApp());
// }

//-------------------------------------------并行动画------------------------------------------

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  // The Tweens are static because they don't change.
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);


  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

   Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
     return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  Widget build(BuildContext context) {
    return new AnimatedLogo(animation: animation);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(new LogoApp());
}