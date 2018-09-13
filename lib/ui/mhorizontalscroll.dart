import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/ui/postCard.dart';

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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                itemCount: categories[i].posts.length,
                itemBuilder: (BuildContext context, int index) {
                  var post = categories[i].posts[index];
                  return new PostCard(post, i);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
