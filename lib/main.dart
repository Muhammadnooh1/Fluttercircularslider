import 'package:flutter/material.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

const TWO_Pi= 3.14*2;
class _MyHomeState extends  State<MyHomePage> {
  Widget build(BuildContext context) {
    final size = 200.0;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Circular Slider"),
            centerTitle: true,

          ),
          body: Center(
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 5),
              builder: (context, value, child) {
                int percentage = (value*100).ceil();
                return Container(
                  child: Container(
                    width: size,
                    height: size,

                    child: Stack(
                      children: <Widget>[
                        ShaderMask(shaderCallback: (react) {
                          return SweepGradient(
                              startAngle: 0.0,
                              endAngle: TWO_Pi,
                              stops: [value, value],
                              center: Alignment.center,
                              colors: [Colors.blue, Colors.grey.withAlpha(55)]
                          ).createShader(react);
                        },
                          child: Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: size - 40,
                            height: size - 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Center(child: Text("$percentage",
                              style: TextStyle(fontSize: 40),

                            )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                );
              },
            ),
          )
      ),
    );
  }
}