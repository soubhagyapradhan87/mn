import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mrun1/model/posts.dart';

import 'package:flutter/material.dart';

import 'package:mrun1/repo/repo.dart';
import 'package:mrun1/ui/homeScreen.dart';

void main() async{
  await getJson();
  runApp(
      new MaterialApp(
        title: "MrunApp",
        debugShowCheckedModeBanner: false,
        home: new HomeScreen(RepoData.posts),
      )
  );
}


Future<String> getJson() async {
  String apiurl = "http://mrunalinee.com/wp-json/wp/v2/posts";
  String imgurl="http://mrunalinee.com/wp-json/wp/v2/media?parent=";
  http.Response response = await http.get(apiurl);
  RepoData.data=json.decode(response.body);
  print(RepoData.data);
  List<Post> list=new List<Post>();
  for(var x in RepoData.data){
    String a=x["id"].toString();
    http.Response response1 = await http.get(imgurl+a);
    //print(imgurl+a);
    List imageData=json.decode(response1.body);
    Post p=new Post(title: x["title"]["rendered"], id: a, link: x["link"], imglink: imageData[0]["guid"]["rendered"],date: x["date"]);
    list.add(p);

  }

  Posts posts=await new Posts(name: "Mrunalinee", location: "Bangalore", logo: "assets/back.png",
      backdropPhoto: "assets/thumbnail.png", about: "One Stop For Authentic Odia Recipes", post: list);
  RepoData.posts=posts;
  print(RepoData.posts);
  return  "succss";


}