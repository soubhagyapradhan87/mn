import 'package:flutter/material.dart';
import 'package:mrun1/model/home.dart';
import 'package:mrun1/ui/mhorizontalscroll.dart';
import 'package:mrun1/ui/mstack.dart';
import 'package:mrun1/ui/mverticalscroll.dart';
import 'package:mrun1/ui/postCard.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatelessWidget {
  HomeScreen(@required this.home);

  final Home home;


  /*final background = Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/thumbnail.png'),
        fit: BoxFit.cover,
      ),
    ),
  );*/


  @override
  Widget build(BuildContext context) {

    return new Mstack(home);
  }



}
