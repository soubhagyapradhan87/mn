import 'package:flutter/material.dart';
import 'package:mrun1/model/posts.dart';
import 'package:mrun1/ui/postCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(@required this.posts);

  final Posts posts;

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
        children: <Widget>[_createCourseScroller()],
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
                  posts.logo,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Padding(padding: const EdgeInsets.only(right: 10.0)),
              Text(
                posts.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 17.0)),
          Text(
            posts.location,
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
            posts.about,
            style:
                new TextStyle(color: Colors.white, height: 1.4, fontSize: 17.0),
          ),
          Padding(padding: const EdgeInsets.only(top: 15.0)),

        ],
      ),
    );
  }


  Widget _createCourseScroller() {
    return new Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20.0),
                  border: new Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                height: 25.0,
                width: 320.0,

                child: Text("Item Title",style: TextStyle(color: Colors.white,fontSize: 15.0),textAlign: TextAlign.center,),
              ),

              Container(
                child: new SizedBox.fromSize(
                  size: new Size.fromHeight(300.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    itemCount: posts.post.length,
                    itemBuilder: (BuildContext context, int index) {
                      var post = posts.post[index];
                      return new PostCard(post);
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
