import 'dart:html';

import 'package:admission_process/global_variables.dart';
import 'package:admission_process/widgets/documents_row_firebase.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;

class DocumentsView extends StatefulWidget {
  @override
  _DocumentsViewState createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {

  fb.UploadTask _uploadTask;
  bool _isVisible = false;
  bool _isDone = false;

  CircularProgressIndicator circularProgressIndicator = CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            DocumentsRowFirebase(title: 'Date of Birth Certificate',),
            Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
            DocumentsRowFirebase(title: 'Identity Proof',),
          ],
        ),
        Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
        Column(
          children: [
            DocumentsRowFirebase(title: 'Address Proof',),
            Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
            DocumentsRowFirebase(title: '10th Grade Marks Sheet',),
          ],
        ),
        Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
        Column(
          children: [
            DocumentsRowFirebase(title: '12th Grade Marks Sheet',),
            Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
            DocumentsRowFirebase(title: 'GATE Rank Certificate',),
          ],
        ),
        Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
        Column(
          children: [
            DocumentsRowFirebase(title: 'CET Rank Certificate',),
            Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
            DocumentsRowFirebase(title: 'UG Certificate',),
          ],
        ),
        Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
        Column(
          children: [
            DocumentsRowFirebase(title: 'Transfer Certificate',),
            Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.white, thickness: 2.0,)),
            DocumentsRowFirebase(title: 'Nationality Proof',),
          ],
        ),
      ],
    );
  }
}
