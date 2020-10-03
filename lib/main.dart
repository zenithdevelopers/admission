import 'package:admission_process/stepper/my_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_widget/zoom_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Admission Process',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // title: Image.asset('assets/college_logo.png', fit: BoxFit.cover,height: 150.0, width: 248.0,),
            // centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/college_logo_kannada.png', height: 50, width: 100,),
                Image.asset('assets/college_logo_middle.png', height: 70, width: 60,),
                Image.asset('assets/college_logo_title.png', height: 50, width: 100,),
                Expanded(child: SizedBox(width: 1.0,)),
                Expanded(child: SizedBox(width: 1.0,)),
                Text('Application Form', style: TextStyle(color: Colors.black),),
                IconButton(icon: Icon(Icons.assignment), onPressed: null, padding: EdgeInsets.fromLTRB(0, 6, 0, 0),),
                Expanded(child: SizedBox(width: 1.0,)),
                Expanded(child: SizedBox(width: 1.0,)),
                Expanded(child: SizedBox(width: 1.0,)),
              ],
            ),
            backgroundColor: Colors.grey.shade300,
            toolbarHeight: 100.0,
          ),
          body: MyStepper(),
        ));
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
