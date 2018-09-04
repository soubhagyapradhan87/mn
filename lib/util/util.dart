import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mrun1/repo/repo.dart';

/*void main() async {
  var s = "Sunil Pradhan";

  print(s);

  String apiurl = "http://mrunalinee.com/wp-json/wp/v2/posts";
  http.Response response = await http.get(apiurl);
  RepoData.data = json.decode(response.body);
  print(RepoData.data[0]["content"]["rendered"]);

  String s1 = RepoData.data[0]["content"]["rendered"];


  print(Util.getYoutubeLink(s1));
}*/


class Util{

  static String getYoutubeLink(String s){

    int s1 = s.lastIndexOf("http://www.youtube.com/embed/");
    return "https://www.youtube.com/watch?v="+s.substring(s1+29,s1+40);
  }
}
