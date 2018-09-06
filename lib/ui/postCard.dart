
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mrun1/model/posts.dart';


class PostCard extends StatelessWidget {
  PostCard(this.post);

  final Post post;


//  void _onTap(){
//    Navigator.push(context, MaterialPageRoute(builder: (context)=>Pageview()));
//  }

  BoxDecoration _createShadowCorners() {
    return BoxDecoration(

        color: Colors.white.withOpacity(0.4),
        borderRadius: new BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0)
        ]);
  }

  Widget _createThumbnail() {
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Stack(

        children: <Widget>[
          Image.network(post.imgLink),
          Center(
            child:Container(
              height: 70.0,
              width: 80.0,
              child: FlatButton(
                  onPressed: ()async{
                    if(await canLaunch("https://www.youtube.com")){
                      await launch("https://www.youtube.com");
                    }
                  },
                  child: Image.asset("assets/youtube.png")),
            )

          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _createShadowCorners(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Flexible(
//            flex: 3,
//            child: _createThumbnail(),
//          ),
//          Flexible(flex: 4, child: createCourseInfo())
        Container(
          height:120.0,
          child: _createThumbnail(),
        ),
          Padding(padding: const EdgeInsets.only(top: 25.0)),
          Container(
            height: 90.0,
            child: createCourseInfo(),
          )

        ],
      ),
    );
  }



  Widget createCourseInfo() {
    return new Column(
      children: <Widget>[

           FlatButton(
             onPressed:(){
               //Navigator.push(context, MaterialPageRoute(builder: (context)=>Pageview()));

             },
             child: Container(
                 height:60.0,
                 child: Text(
                   post.title,
                   style: TextStyle(color: Colors.white.withOpacity(1.0),fontSize: 17.0),
                 )),
           ),
            Padding(padding: const EdgeInsets.only(top: 15.0)),
            Text(
              post.date,
              style: TextStyle(color: Colors.white.withOpacity(1.0),fontSize: 11.0,
                  fontWeight: FontWeight.bold),
            ),

      ],
    );
  }
}
