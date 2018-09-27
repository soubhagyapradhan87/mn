import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mrun1/model/home.dart';

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

  List<Category> catList=new List<Category>();

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

    catList.add(cat);


  }
print("creating home");
  Home home=await new Home(name: "Mrunalinee", location: "A Magical touch to Odia cuisine", logo: "assets/back.png",
      backdropPhoto: "assets/thumbnail.png", about: "A Magical touch to Odia cuisine", categories: catList);

  RepoData.home=home;

  return  "succss";
}