import 'dart:async';

import 'package:mrun1/model/home.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mrun1/util/util.dart';


class RepoData{
  static List latestPostJsonList;
  static List postJsonList;
  static List catJsonList;
  static Home home;
  static Set<String> searchSuggestionList=new Set<String>();
  static List<Post> searchList=new List<Post>();


  static Future<String> searchPost(String str) async {
    String searchUrl = "http://mrunalinee.com/wp-json/wp/v2/posts?search=";
    String imgUrl = "http://mrunalinee.com/wp-json/wp/v2/media?parent=";
    http.Response responsePostUrl = await http.get(searchUrl + str);
    RepoData.postJsonList = json.decode(responsePostUrl.body);


    for (var y in RepoData.postJsonList) {
      String youtubeLink = Util.getYoutubeLink(y["content"]["rendered"]);
      http.Response response1 = await http.get(imgUrl + y["id"].toString());
      List imageData = json.decode(response1.body);

      Post post = await new Post(title: y["title"]["rendered"],
          id: y["id"].toString(),
          link: y["link"],
          youtubeLink: youtubeLink,
          imgLink: imageData[0]["media_details"]["sizes"]["medium"]["source_url"],
          date: y["date"],
          htmlContent: y["content"]["rendered"]);
      searchList.add(post);
      //cat.posts.add(post);
      return "success";
    }
  }

  static Future<String> getPosts(int postPageIndex,Category cat) async{

    String postByCatUrl="http://www.mrunalinee.com/wp-json/wp/v2/posts?categories="+cat.id+"&per_page=3&page=";
    String imgUrl="http://mrunalinee.com/wp-json/wp/v2/media?parent=";
    http.Response responsePostUrl = await http.get(postByCatUrl+postPageIndex.toString());
    RepoData.postJsonList=json.decode(responsePostUrl.body);

    //print("first loop started");
    //List<Post> postList=new List<Post>();
    for(var y in RepoData.postJsonList){

      //print("for loop started");
      //added to fetch youtube link from blog post
      String youtubeLink=Util.getYoutubeLink(y["content"]["rendered"]);
      //print(youtubeLink);

      //Fetch image
      http.Response response1 = await http.get(imgUrl+y["id"].toString());
      //print(imgUrl+y["id"].toString());
      List imageData=json.decode(response1.body);

      Post post=  await new Post(title: y["title"]["rendered"], id: y["id"].toString(), link: y["link"],youtubeLink: youtubeLink, imgLink: imageData[0]["media_details"]["sizes"]["medium"]["source_url"],date: y["date"],htmlContent: y["content"]["rendered"]);;
      //print(post.title);
      //print(imageData[0]["media_details"]["sizes"]["medium"]["source_url"]);

      cat.posts.add(post);
    }
    return "success";
  }
}