import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mrun1/main.dart';
import 'package:mrun1/repo/repo.dart';
import 'package:mrun1/ui/homeScreen.dart';

import 'dart:async';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()   {
    // TODO: implement initState
    super.initState();
    // getJson();
    Timer(Duration(seconds: 5),abc);
  }

  void abc() async{
    await getJson();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(RepoData.posts)),
      );

  }
//  final background = Container(
//    decoration: BoxDecoration(
//      image: DecorationImage(
//        image: AssetImage('assets/thumbnail.png'),
//        fit: BoxFit.cover,
//      ),
//    ),
//    child: new BackdropFilter(
//      filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//
//    ),
//  );
//  final greenOpacity = Container(
//    color: Color(0xAA69654F),
//  );

  Widget genrateBluredImage() {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/thumbnail.png"),
          fit: BoxFit.cover,
        ),
      ),
      //I blured the parent conainer to blur background image, you can get rid of this part
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: new Container(
          //you can change opacity with color here(I used black) for background.
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          genrateBluredImage(),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/back.png"),
                          radius: 60.0,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 20.0)),
                        Text(
                          "Mrunalinee",
                          style: TextStyle(fontSize: 30.0,color: Colors.white),
                        ),
                      ],
                    ),
                  )
              ),
              Expanded(flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(padding: const EdgeInsets.only(top: 20.0)),
                      Text("Some Text are there!!!",style: TextStyle(color: Colors.white,
                      fontSize: 15.0),)
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
