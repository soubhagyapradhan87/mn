import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/ui/mhorizontalscroll.dart';
import 'package:mrun1/ui/postCard.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class MPageView extends StatefulWidget {

  MPageView(this.posts);
  final List<Post> posts;
  static int postIndex;

  @override
  _MPageViewState createState() => _MPageViewState(posts);


}

class _MPageViewState extends State<MPageView> {
  _MPageViewState(this.posts);
  final List<Post> posts;


  final _controller = new PageController(
      initialPage: MPageView.postIndex
  );


  List<Widget> createPostWebViews(){
    print(MPageView.postIndex);
    String html = '<h1>This is heading 1</h1> <h2>This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6><p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>';
    List<Widget> li=new List<Widget>();
    for(var xx in posts){
      //print(x.htmlContent);
      li.add( new WebviewScaffold(
          url: xx.link,
          withJavascript: true,
          withLocalStorage: true,
          appBar: new AppBar(
              title: new Text(xx.link),
              automaticallyImplyLeading: false,
             /* actions: <Widget>[new IconButton(icon: new ExpandIcon(), onPressed: () {
                _putUserName('');
                Navigator.of(context)
                    .pushReplacementNamed ('/');
              }),]*/
          ),
        ),

      );
    }
    return li;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> lw=createPostWebViews();
    return Scaffold(

      body: Container(
        child: PageView.builder(
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return lw[index % lw.length];
            }),
      ),
    );
  }
}
