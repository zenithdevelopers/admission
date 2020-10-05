import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admission_process/global_variables.dart';
import 'package:admission_process/widgets/dropdown.dart';
import 'package:admission_process/widgets/text_form_field.dart';

class ParentDetails extends StatefulWidget {
  @override
  _ParentDetailsState createState() => _ParentDetailsState();
}

class _ParentDetailsState extends State<ParentDetails> {
  BoxDecoration leftBoxDecoration = BoxDecoration(
    border: Border(
        left: BorderSide(
          //                   <--- left side
          color: Colors.green,
          width: 3.0,
        ),
        top: BorderSide(
          //                    <--- top side
          color: Colors.green,
          width: 3.0,
        ),
        bottom: BorderSide(
          color: Colors.green,
          width: 3.0,
        )),
  );

  BoxDecoration rightBoxDecoration = BoxDecoration(
    border: Border(
        right: BorderSide(
          //                   <--- left side
          color: Colors.green,
          width: 3.0,
        ),
        top: BorderSide(
          //                    <--- top side
          color: Colors.green,
          width: 3.0,
        ),
        bottom: BorderSide(
          color: Colors.green,
          width: 3.0,
        )),
  );

  List<Widget> widgetList = <Widget>[
    Container(
      // decoration: leftBoxDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '• Father Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          MyTextFormField(
            text: 'Father Name',
            editingController: Global.fatherNameEditingController,
          ),
          MyTextFormField(
            text: 'Father Mobile Number',
            editingController: Global.fatherMobileEditingController,
          ),
          MyTextFormField(
            text: 'Father Email ID',
            editingController: Global.fatherEmailEditingController,
          ),
          CategoryDropDown(
            text: 'Father Income',
          ),
          MyTextFormField(
            text: 'Father Occupation',
            editingController: Global.fatherOccupationEditingController,
          ),
          MyTextFormField(
            text: 'Father Address',
            editingController: Global.fatherAddressEditingController,
          ),
        ],
      ),
    ),
    Container(
      // decoration: rightBoxDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '• Mother Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          MyTextFormField(
            text: 'Mother Name',
            editingController: Global.motherNameEditingController,
          ),
          MyTextFormField(
            text: 'Mother Number',
            editingController: Global.motherMobileEditingController,
          ),
          MyTextFormField(
            text: 'Mother Email ID',
            editingController: Global.motherEmailEditingController,
          ),
          CategoryDropDown(
            text: 'Mother Income',
          ),
          MyTextFormField(
            text: 'Mother Occupation',
            editingController: Global.motherOccupationEditingController,
          ),
          MyTextFormField(
            text: 'Mother Address',
            editingController: Global.motherAddressEditingController,
          ),
        ],
      ),
    ),
    Container(
      // margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      // decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 3.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '• Guardian Details (Optional)',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          MyTextFormField(
            text: 'Guardian Name',
            editingController: Global.guardianNameEditingController,
          ),
          MyTextFormField(
            text: 'Guardian Mobile Number',
            editingController: Global.guardianMobileEditingController,
          ),
          MyTextFormField(
            text: 'Guardian Email ID',
            editingController: Global.guardianEmailEditingController,
          ),
          CategoryDropDown(
            text: 'Guardian Income',
          ),
          MyTextFormField(
            text: 'Guardian Occupation',
            editingController: Global.guardianOccupationEditingController,
          ),
          MyTextFormField(
            text: 'Guardian Address',
            editingController: Global.guardianAddressEditingController,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      child: (mediaQuery.width <= 800)
          ? Column(
              children: widgetList,
            )
          : Row(
              children: List.generate(widgetList.length,
                  (index) => Expanded(child: widgetList[index])),
            ),
    );
  }
}
