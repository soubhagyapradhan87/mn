import 'package:flutter/material.dart';

class MDropDownBox extends StatefulWidget {
  MDropDownBox(this.listvalues);
  final List<String> listvalues;
  @override
  _MDropDownBoxState createState() => _MDropDownBoxState(listvalues);
}

class _MDropDownBoxState extends State<MDropDownBox> {
  _MDropDownBoxState(this.listvalues);
  List<String> listvalues;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
         //
          itemCount: listvalues.length,
          itemBuilder: (BuildContext context, int index) {
            var post = listvalues[index];
            return Text(post,style: TextStyle(color: Colors.white),);
          }
      ),
    );
  }



}
