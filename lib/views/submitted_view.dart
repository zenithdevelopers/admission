import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class SubmittedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Zoom(height: 670, width: 1370,child: Container(child: SizedBox.expand(child: Image(image: AssetImage('ty.png'),),)));
  }
}
