import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/repo/repo.dart';
import 'package:mrun1/ui/postCard.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mrun1/util/util.dart';

class MHorizontalScroll extends StatefulWidget {
  MHorizontalScroll(this.categories,this.i);
  final List<Category> categories;

  final int i;
  @override
  _MHorizontalScrollState createState() => _MHorizontalScrollState(categories,i);
}

class _MHorizontalScrollState extends State<MHorizontalScroll> {

  _MHorizontalScrollState(this.categories,this.i);

  final List<Category> categories;
  final int i;
  var postPageIndex=1;

//  @override
//  void initState() {
//    _loadMore();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 20.0,
            width: 320.0,

            child: Text(categories[i].title,style: TextStyle(color: Colors.white,fontSize: 15.0),textAlign: TextAlign.center,),
          ),

          Container(
            child: new SizedBox.fromSize(
              size: new Size.fromHeight(300.0),
              child:LazyLoadScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  itemCount: categories[i].posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    var post = categories[i].posts[index];
                    RepoData.searchSuggestionList.add(post.title);
                    return new PostCard(post, i);
                  },
                ),
                onEndOfPage: _loadMore,
              )
              
            ),
          )
        ],
      ),
    );
  }



  void _loadMore() {
    setState(() {
      //var a=new RepoData();
      postPageIndex++;
      RepoData.getPosts(postPageIndex,categories[i]);

    });
  }



}
