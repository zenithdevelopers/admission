import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {

  String text;

  TextContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: myBoxDecoration(),
      child: Center(child: Text(text, style: TextStyle(fontSize: 16.0, color: Colors.black),)),
    );
  }
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.grey.shade500),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
      ),
    );
  }
}
