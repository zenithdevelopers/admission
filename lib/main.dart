import 'package:admission_process/stepper/my_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_widget/zoom_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admission Process',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Image.asset('assets/college_logo.png', fit: BoxFit.cover,height: 150.0, width: 248.0,),
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo_university.png',
              width: mediaSize.width / 5.4,
            ),
            // Image.asset(
            //   'assets/college_logo_kannada.png',
            //   height: 50,
            //   width: mediaSize.width / 14,
            // ),
            // Image.asset(
            //   'assets/college_logo_middle.png',
            //   height: 70,
            //   width: mediaSize.width / 27,
            // ),
            // Image.asset(
            //   'assets/college_logo_title.png',
            //   height: 50,
            //   width: mediaSize.width / 14,
            // ),
            Expanded(
                child: SizedBox(
              width: 1.0,
            )),
            Expanded(
                child: SizedBox(
              width: 1.0,
            )),
            Text(
              "Application Form",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: (mediaSize.width < 600) ? 14 : 20),
            ),
            IconButton(
              icon: Icon(Icons.assignment),
              onPressed: null,
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
            ),
            Expanded(
                child: SizedBox(
              width: 1.0,
            )),
            Expanded(
                child: SizedBox(
              width: 1.0,
            )),
            Expanded(
                child: SizedBox(
              width: 1.0,
            )),
          ],
        ),
        backgroundColor: Colors.grey.shade300,
        toolbarHeight: (mediaSize.width < 800) ? 50 : 100,
      ),
      body: MyStepper(),
    );
  }
}

//
// final data = Details(
//     name: name,
//     branch: branch,
//     previousCollege: previousCollege,
//     courseInPreviousCollege: courseInPreviousCollege,
//     tenthMarks: tenthMarks,
//     twelfthMarks: twelfthMarks
// );
// FirebaseFirestore.instance.collection('Applicant Details').add(data.toMap());
