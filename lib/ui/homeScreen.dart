import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/ui/mhorizontalscroll.dart';
import 'package:mrun1/ui/mverticalscroll.dart';
import 'package:mrun1/ui/postCard.dart';

/*
class MasterScreen extends StatefulWidget{
  MasterScreen(@required this.home);
  Home home;
  @override
  State<StatefulWidget> createState()=> new MasterScreenState(home);


// TODO: implement createState


}
class MasterScreenState extends State<MasterScreen>{
  MasterScreenState(@required this.home);
  Home home;

  ScrollController controller;

  @override
  void initState() {
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new HomeScreen(home, controller);
  }

  void _scrollListener() {


    if (controller.position.extentAfter < 300 ) {
      */
/*setState(() {
        items.addAll(new List.generate(42, (index) => 'Inserted $index'));
      });*//*


      print(controller.position.extentAfter);
    }
  }

}
*/

class HomeScreen extends StatelessWidget {
  HomeScreen(@required this.home);

  final Home home;


  final background = Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/thumbnail.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
  final opacity = Container(
    color: Color(0xAA69654F),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(

//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            DrawerHeader(
//              child: Text("gfgfhgfhg"),
//            )
//          ],
//        ),
//      ),
      body: _stack()
    );
  }

  Widget _stack(){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        background,
        opacity,
        MVerticalScroll(home)
      ],
    );
  }









}
