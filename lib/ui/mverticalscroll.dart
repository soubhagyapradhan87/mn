import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/repo/repo.dart';
import 'package:mrun1/ui/mhorizontalscroll.dart';
import 'package:mrun1/ui/postCard.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mrun1/util/util.dart';

class MVerticalScroll extends StatefulWidget {
  MVerticalScroll(this.home);
  final Home home;


  @override
  _MVerticalScrollState createState() => _MVerticalScrollState(home);
}

class _MVerticalScrollState extends State<MVerticalScroll> {

  _MVerticalScrollState(this.home);

  final Home home;
  ScrollController controller;
  var catPageIndex=1;
//  @override
//  void initState() {
//    _loadMore();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
        child: ListView(
          controller: controller,
          children: <Widget>[
            _heading(),
            SingleChildScrollView(
              child: _createContent(),
            )
          ],
        ),
        onEndOfPage: _loadMore);
  }

  Widget _createContent() {
    return new SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createCategoriesArray(),
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


    );
  }

  Widget _heading() {
    return new Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 14.0, right: 14.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          /*new Row(
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
          ),*/
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
          /*new Text(
            home.about,
            style:
            new TextStyle(color: Colors.white, height: 1.4, fontSize: 17.0),
          ),
          Padding(padding: const EdgeInsets.only(top: 15.0)),*/

        ],
      ),
    );
  }


  void _loadMore() {
    setState(() {
      getCategories();

    });
  }

  Future<String> getCategories() async{

    String catUrl = "http://mrunalinee.com/wp-json/wp/v2/categories?per_page=3&page=";
    String postByCatUrl="http://www.mrunalinee.com/wp-json/wp/v2/posts?per_page=3&page=1&categories=";
    String imgUrl="http://mrunalinee.com/wp-json/wp/v2/media?parent=";


    catPageIndex++;

    http.Response responseCatUrl = await http.get(catUrl+catPageIndex.toString());
    RepoData.catJsonList=json.decode(responseCatUrl.body);


    //Adding other Categories
    print("out of first loop");
    for(var x in RepoData.catJsonList){
      http.Response responsePostUrl = await http.get(postByCatUrl + x["id"].toString());
      RepoData.postJsonList=json.decode(responsePostUrl.body);

      List<Post> postList=new List<Post>();
      for(var y in RepoData.postJsonList){

        String youtubeLink=Util.getYoutubeLink(y["content"]["rendered"]);


        //Fetch image
        http.Response response1 = await http.get(imgUrl+y["id"].toString());

        List imageData=json.decode(response1.body);

        Post post=  await new Post(title: y["title"]["rendered"], id: y["id"].toString(), link: y["link"],youtubeLink: youtubeLink, imgLink: imageData[0]["media_details"]["sizes"]["medium"]["source_url"],date: y["date"],htmlContent: y["content"]["rendered"]);;

        postList.add(post);
      }


      Category cat=await new Category(title: x["name"], id: x["id"].toString(), posts: postList);

      home.categories.add(cat);


    }


  }



}
