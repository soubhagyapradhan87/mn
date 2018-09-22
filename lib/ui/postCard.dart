
import 'package:flutter/material.dart';
import 'package:mrun1/ui/mhorizontalscroll.dart';
import 'package:mrun1/ui/mpageview.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mrun1/model/home.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_youtube/flutter_youtube.dart';



class PostCard extends StatelessWidget {
  PostCard(this.post,this.catIndex);

  final int catIndex;
  final Post post;

  BuildContext context;
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  BoxDecoration _createShadowCorners() {
    return BoxDecoration(

        color: Colors.white.withOpacity(0.4),
        borderRadius: new BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0)
        ]);
  }

  void playYoutubeVideo() {

    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyAvZxrNjvwomM9PloY-vk2rO4QxAI35Gc0",
      videoUrl: post.youtubeLink,
      autoPlay: true,
    );
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
                  onPressed:playYoutubeVideo
                  /*()async{
                    if(await canLaunch(post.youtubeLink)){
                      await launch(post.youtubeLink);
                    }
                  }*/,
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
          Padding(padding: const EdgeInsets.only(top: 21.0)),
          GestureDetector(
            onTap: () async {
              MHorizontalScroll mh=context.ancestorWidgetOfExactType(MHorizontalScroll) as MHorizontalScroll;
              print(mh.categories.length);
              MPageView.postIndex=mh.categories[catIndex].posts.indexOf(post);


              if(await canLaunch(post.link)){
              await launch(post.link,forceWebView: true);
              }


              /*Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebviewScaffold(
                url: post.link,
                withJavascript: true,
                withLocalStorage: true,
                appBar: new AppBar(
                  title: new Text(post.link),
                  automaticallyImplyLeading: false,
                  *//* actions: <Widget>[new IconButton(icon: new ExpandIcon(), onPressed: () {
                _putUserName('');
                Navigator.of(context)
                    .pushReplacementNamed ('/');
              }),]*//*
                ),
              )
              ));*/
            },
            child: Container(
              height: 90.0,
              child: createCourseInfo(),
            )
            ,
          )

        ],
      ),
    );
  }






  Widget createCourseInfo() {

    return new Column(
      children: <Widget>[

        Container(
                 height:60.0,
                 child: Text(
                   post.title,
                   style: TextStyle(color: Colors.white.withOpacity(1.0),fontSize: 15.0),
                   textAlign: TextAlign.center,
                 )),

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
