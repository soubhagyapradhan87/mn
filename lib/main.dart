import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mrun1/model/posts.dart';

import 'package:flutter/material.dart';

import 'package:mrun1/repo/repo.dart';
import 'package:mrun1/ui/homeScreen.dart';
import 'package:mrun1/util/util.dart';

void main() async{
  await getJson();
  runApp(
      new MaterialApp(
        title: "MrunApp",
        debugShowCheckedModeBanner: false,
        home: new HomeScreen(RepoData.home)
        //home:null
      )
  );
}


Future<String> getJson() async {
  String postUrl = "http://mrunalinee.com/wp-json/wp/v2/posts";
  String catUrl = "http://mrunalinee.com/wp-json/wp/v2/categories?per_page=3&page=1";
  String postByCatUrl="http://www.mrunalinee.com/wp-json/wp/v2/posts?per_page=3&page=1&categories=";
  String imgUrl="http://mrunalinee.com/wp-json/wp/v2/media?parent=";

  http.Response responseCatUrl = await http.get(catUrl);
  RepoData.catJsonList=json.decode(responseCatUrl.body);
   print("catjson lenth ${RepoData.catJsonList.length}");
  //print("sunil");
  List<Category> catList=new List<Category>();


 /* //Adding Lastest upload List in the Categories

  List<Post> latestPostList=new List<Post>();
  http.Response responseLatestPostUrl = await http.get(postUrl);
  RepoData.data=json.decode(responseLatestPostUrl.body);
  print("latestjsonlength ${RepoData.data.length}");
   print(RepoData.data);
  for(var t in RepoData.data) {
   *//* Post post = new Post(title: z["title"]["rendered"], id: z["id"], link: z["link"], youtubeLink: null, imgLink: null, date: z["date"]);

    latestPostList.add(post);*//*
   print("hgdhdhd");
  }
  print("latestjsonlength ${latestPostJsonList.length}");
  //print(latestPostList.length);
  print("latestPostList ${latestPostList.length}");
  //Category cat=new Category(title: "Latest Uploads", id: "12", posts: latestPostList);
 // catList.add(cat);
*/
  //Adding other Categories
print("out of first loop");
  for(var x in RepoData.catJsonList){
    http.Response responsePostUrl = await http.get(postByCatUrl + x["id"].toString());
    RepoData.postJsonList=json.decode(responsePostUrl.body);

    //print("first loop started");
    List<Post> postList=new List<Post>();
    for(var y in RepoData.postJsonList){

      //print("for loop started");
      //added to fetch youtube link from blog post
      String youtubeLink=Util.getYoutubeLink(y["content"]["rendered"]);
      //print(youtubeLink);

      //Fetch image
      http.Response response1 = await http.get(imgUrl+y["id"].toString());
      //print(imgUrl+y["id"].toString());
      List imageData=json.decode(response1.body);

      Post post=  await new Post(title: y["title"]["rendered"], id: y["id"].toString(), link: y["link"],youtubeLink: youtubeLink, imgLink: imageData[0]["media_details"]["sizes"]["medium"]["source_url"],date: y["date"]);;
      //print(post.title);
      //print(imageData[0]["media_details"]["sizes"]["medium"]["source_url"]);
      postList.add(post);
    }

    //print("hello");
    //print(x["name"]);
    //print(x["id"]);
    //print(x["name"]);
    Category cat=await new Category(title: x["name"], id: x["id"].toString(), posts: postList);
    //print(cat.title);
    catList.add(cat);

    //print("for loop ended");
  }
print("creating home");
  Home home=await new Home(name: "Mrunalinee", location: "Bangalore", logo: "assets/back.png",
      backdropPhoto: "assets/thumbnail.png", about: "One Stop For Authentic Odia Recipes", categories: catList);
  //print("abc");
  RepoData.home=home;
  //print(RepoData.home);
  return  "succss";
}