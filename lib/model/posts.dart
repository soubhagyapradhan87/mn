import 'package:meta/meta.dart';

class Posts {
  Posts(
      {@required this.name,
        @required this.location,
        @required this.logo,
        @required this.backdropPhoto,
        @required this.about,
        @required this.post});

  final String name;
  final String location;
  final String logo;
  final String backdropPhoto;
  final String about;
  final List<Post> post;
}

class Post {
  Post({@required this.title, @required this.id, @required this.link,@required this.imgLink,@required this.date});

  final String title;
  final String id;
  final String link;
  final String imgLink;
  final String date;
}