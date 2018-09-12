import 'package:meta/meta.dart';

class Home {
  Home(
      {@required this.name,
        @required this.location,
        @required this.logo,
        @required this.backdropPhoto,
        @required this.about,
        @required this.categories,
        });

  final String name;
  final String location;
  final String logo;
  final String backdropPhoto;
  final String about;
  //final List<Post> post;
   List<Category> categories;
}

class Post {
  Post({@required this.title, @required this.id, @required this.link,@required this.youtubeLink,@required this.imgLink,@required this.date,@required this.htmlContent});

  final String title;
  final String id;
  final String link;
  final String youtubeLink;
  final String imgLink;
  final String date;
  final String htmlContent;
}

class Category {
  Category({@required this.title, @required this.id, @required this.posts});

  final String title;
  final String id;
  final List<Post> posts;

}