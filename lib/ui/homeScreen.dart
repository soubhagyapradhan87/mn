import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/ui/mhorizontalscroll.dart';
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
  ScrollController controller;

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
        ListView(
          controller: controller,
          children: <Widget>[
            _heading(),
            SingleChildScrollView(
              child: _createContent(),
            )
          ],
        )
      ],
    );
  }

  Widget _createContent() {
    return new SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createCategoriesArray(),
      ),
    );
  }




  Widget _heading() {
    return new Padding(
      padding: const EdgeInsets.only(top: 100.0, left: 14.0, right: 14.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          new Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.white,
                child: new Image.asset(
                  home.logo,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Padding(padding: const EdgeInsets.only(right: 10.0)),
              Text(
                home.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 17.0)),
          Text(
            home.location,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15.0),
          ),
          new Container(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 14.0),
            width: 500.0,
            height: 1.0,
          ),
          new Text(
            home.about,
            style:
                new TextStyle(color: Colors.white, height: 1.4, fontSize: 17.0),
          ),
          Padding(padding: const EdgeInsets.only(top: 15.0)),

        ],
      ),
    );
  }

  List<Widget> _createCategoriesArray(){

    int index=0;
    List<Widget> wList=new List<Widget>();
    for(var x in home.categories){

     wList.add(_createCourseScroller(index)) ;
     index++;

    }
    return wList;
  }

  Widget _createCourseScroller(int i) {
    return new Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: MHorizontalScroll(home.categories,i)

      /*  child: Container(
          child: new SizedBox.fromSize(
            size: new Size.fromHeight(300.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              itemCount: home.categories[i].posts.length,
              itemBuilder: (BuildContext context, int index) {
                var post = home.categories[i].posts[index];
                return new PostCard(post);
              },
            ),
          ),
        )*/

      );
  }

}
