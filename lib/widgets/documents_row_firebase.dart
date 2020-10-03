// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

import '../global_variables.dart';

// ignore: must_be_immutable
class DocumentsRowFirebase extends StatefulWidget {

  String title;

  DocumentsRowFirebase({Key key, this.title}) : super(key: key);

  @override
  _DocumentsRowFirebaseState createState() => _DocumentsRowFirebaseState();
}

class _DocumentsRowFirebaseState extends State<DocumentsRowFirebase> {

  fb.UploadTask _uploadTask;

  bool _isVisible = false;
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: DottedBorder(
        color: Colors.black,
        strokeWidth: 1,
        dashPattern: [6, 3],
        child: Stack(
          children: [
            SizedBox.expand(
              child: FlatButton.icon(
                label: Center(child: Text(widget.title)),
                onPressed: () {
                  setState(() {
                    _isVisible = true;
                    uploadImage();
                  });
                },
                icon: Icon(Icons.add),
              ),
            ),
            _isVisible ? Center(child: CircularProgressIndicator()) : Container(),
            _isDone ? SizedBox.expand(child: Image(image: AssetImage('done.gif'),),) : Container(),
            StreamBuilder<fb.UploadTaskSnapshot>(
              stream: _uploadTask?.onStateChanged,
              builder: (context, snapshot) {
                final event = snapshot?.data;

                double progressPercent = event != null ? event.bytesTransferred / event.totalBytes * 100 : 0;
                if (progressPercent == 100) {
                  getUri(widget.title);
                  return Container();
                } else if (progressPercent == 0) {
                  return SizedBox();
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  uploadToFirebase(File imageFile) async {
    final filePath = '${Global.details.getMobileNumber()}/${widget.title}/${DateTime.now()}';
    setState(() {
      _uploadTask = fb.storage().refFromURL('gs://admission-form-946ea.appspot.com').child(filePath).put(imageFile);
      _isVisible = true;
      _isDone = true;
    });
  }

  uploadImage() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((changeEvent) {
        final file = uploadInput.files.first;
        final reader = FileReader();

        reader.readAsDataUrl(file);

        reader.onLoadEnd.listen((loadEndEvent) async {uploadToFirebase(file);},);
        },
    );
  }

  Future<void> getUri(String title) async {
    Uri imageUri = await _uploadTask.snapshot.ref.getDownloadURL();
    if (title == 'Date of Birth Certificate') {
      Global.details.setDateOfBirthDocument(imageUri.toString());
    } else if (title == 'Identity Proof') {
      Global.details.setIdentityProof(imageUri.toString());
    } else if (title == 'Address Proof') {
      Global.details.setAddressProof(imageUri.toString());
    } else if (title == '10th Grade Marks Sheet') {
      Global.details.setTenthMarkSheet(imageUri.toString());
    } else if (title == '12th Grade Marks Sheet') {
      Global.details.setTwelfthMarkSheet(imageUri.toString());
    } else if (title == 'GATE Rank Certificate') {
      Global.details.setGateRankProof(imageUri.toString());
    } else if (title == 'CET Rank Certificate') {
      Global.details.setCetRankProof(imageUri.toString());
    } else if (title == 'UG Certificate') {
      Global.details.setUgCertificate(imageUri.toString());
    } else if (title == 'Transfer Certificate') {
      Global.details.setTransferCertificate(imageUri.toString());
    } else if (title == 'Nationality Proof') {
      Global.details.setCitizenProofIfForeigner(imageUri.toString());
    }
  }

  Stream<List<Map<String, dynamic>>> userLinks(fs.Firestore firestore) {
    return firestore.collection('links').onSnapshot.map((data) => data.docs.map((doc) => doc.data()).toList());
  }
}
