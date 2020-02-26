import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController animationController;
  Animation colorAnimation;
  Animation sizeAnimation;


  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    // Defining controller with animation duration of two seconds
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));

    // Defining both color and size animations
    colorAnimation=ColorTween(begin: Colors.blue,end: Colors.yellow).animate(animationController);
    sizeAnimation=Tween<double>(begin: 100,end: 300).animate(animationController);

    // Rebuilding the screen when animation goes ahead
    animationController.addListener(() {
      setState(() {});
    });


    // Repeat the animation after finish
    animationController.repeat();


    //For single time
    //animationController.forward()

    //Reverses the animation instead of starting it again and repeats
    //animationController.repeat(reverse: true);


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Container(

          height: sizeAnimation.value,
          width: sizeAnimation.value,
          color: sizeAnimation.value,
        )
      ),
    );
  }
}
