import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/repo/repo.dart';
import 'dart:ui' as ui;

import 'package:mrun1/ui/mverticalscroll.dart';

class Mstack extends StatefulWidget {
  Mstack(this.home);
  final Home home;
  @override
  _MstackState createState() => _MstackState(home);
}

class _MstackState extends State<Mstack> {
  _MstackState(this.home);
   final Home home;


  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/thumbnail.png', fit: BoxFit.fitHeight,),
          BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: Scaffold(
              appBar: AppBar(
                title: new Text("Mrunalinee"),
                leading: Image.asset('assets/back.png'),
                elevation: 0.0,
                backgroundColor: Colors.black.withOpacity(0.4),
                  /*actions: <Widget>[
                     IconButton(
                        icon: new Icon(Icons.search),
                        tooltip: 'Search',
                        onPressed: (){
                          showSearch(context: context, delegate: DataSearch());
                        }
                    ),
                  ],*/

            ),
                backgroundColor: Colors.transparent,
                body: MVerticalScroll(home)
            ),
          ),
        ],
      );
    }

  }

  /*class DataSearch extends SearchDelegate<String>{

    var mList=RepoData.searchSuggestionList;

  final mList=[
    "puri",
    "dahi puri",
    "bhel puri",
    "chatani",
    "Gupchup",
    "Tarabhuja Juice",
    "Dahi Pakhala ",
    "Veg Chaw mein",
    "Alu Masala Sandwich",
    "Rabidi",
    "Kancha Amba Chatani"
  ];
  final recentList=[
    "chatani",
    "Gupchup",
    "Tarabhuja Juice"
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.black.withOpacity(0.4),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query="";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation
        ),
        onPressed: (){
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList=query.isEmpty
        ?recentList
        :mList.where((p)=>p.toLowerCase().contains(query)).toList();
    print(query);
    print(suggestionList[0]);
    print(suggestionList[0].indexOf(query,0));
    print(suggestionList[0].replaceAll("|", " "));
    print(suggestionList[0].replaceAll("|", " ").indexOf(query,0));
    return ListView.builder(
        itemBuilder: (context,index)=>ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.search),
          title: RichText(
              text: TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ]
          )
          ),
        ),
      itemCount: suggestionList.length,
    );
  }

  }*/

