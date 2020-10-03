import 'package:flutter/material.dart';

import '../global_variables.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {

  String text;
  TextEditingController editingController;

  MyTextFormField({Key key, this.text, this.editingController}) : super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          controller: widget.editingController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: widget.text,
            contentPadding: EdgeInsets.fromLTRB(8, 20, 0, 4),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
          onChanged: (String value) {
            setState(() {
              if (widget.text == 'Name') {
                _formKey.currentState.validate();
                Global.details.setName(value);
              } else if (widget.text == 'Place of Birth') {
                _formKey.currentState.validate();
                Global.details.setPlaceOfBirth(value);
              } else if (widget.text == 'Nationality') {
                _formKey.currentState.validate();
                Global.details.setNationality(value);
              } else if (widget.text == 'Religion') {
                _formKey.currentState.validate();
                Global.details.setReligion(value);
              } else if (widget.text == 'Caste') {
                _formKey.currentState.validate();
                Global.details.setCaste(value);
              } else if (widget.text == 'Blood Group') {
                _formKey.currentState.validate();
                Global.details.setBloodGroup(value);
              } else if (widget.text == 'Mother Tongue') {
                _formKey.currentState.validate();
                Global.details.setMotherTongue(value);
              } else if (widget.text == 'Mobile Number') {
                _formKey.currentState.validate();
                Global.details.setMobileNumber(value);
              } else if (widget.text == 'Permanent Address') {
                _formKey.currentState.validate();
                Global.details.setAddress(value);
              } else if (widget.text == 'Father Name') {
                _formKey.currentState.validate();
                Global.details.setFatherName(value);
              } else if (widget.text == 'Father Mobile Number') {
                _formKey.currentState.validate();
                Global.details.setFatherMobileNumber(value);
              } else if (widget.text == 'Father Email ID') {
                _formKey.currentState.validate();
                Global.details.setFatherEmail(value);
              } else if (widget.text == 'Father Income') {
                _formKey.currentState.validate();
                Global.details.setFatherIncome(value);
              } else if (widget.text == 'Father Occupation') {
                _formKey.currentState.validate();
                Global.details.setFatherOccupation(value);
              } else if (widget.text == 'Father Address') {
                _formKey.currentState.validate();
                Global.details.setFatherAddress(value);
              } else if (widget.text == 'Mother Name') {
                _formKey.currentState.validate();
                Global.details.setMotherName(value);
              } else if (widget.text == 'Mother Number') {
                _formKey.currentState.validate();
                Global.details.setMotherMobileNumber(value);
              } else if (widget.text == 'Mother Email ID') {
                _formKey.currentState.validate();
                Global.details.setMotherEmail(value);
              } else if (widget.text == 'Mother Income') {
                _formKey.currentState.validate();
                Global.details.setMotherIncome(value);
              } else if (widget.text == 'Mother Occupation') {
                _formKey.currentState.validate();
                Global.details.setMotherOccupation(value);
              } else if (widget.text == 'Mother Address') {
                _formKey.currentState.validate();
                Global.details.setMotherAddress(value);
              } else if (widget.text == 'Guardian Name') {
                Global.details.setGuardianName(value);
              } else if (widget.text == 'Guardian Mobile Number') {
                Global.details.setGuardianMobileNumber(value);
              } else if (widget.text == 'Guardian Email ID') {
                Global.details.setGuardianEmail(value);
              } else if (widget.text == 'Guardian Income') {
                Global.details.setGuardianIncome(value);
              } else if (widget.text == 'Guardian Occupation') {
                Global.details.setGuardianOccupation(value);
              } else if (widget.text == 'Guardian Address') {
                Global.details.setGuardianAddress(value);
              } else if (widget.text == 'Branch') {
                _formKey.currentState.validate();
                Global.details.setBranch(value);
              } else if (widget.text == 'Previous College') {
                _formKey.currentState.validate();
                Global.details.setPreviousCollege(value);
              } else if (widget.text == 'Course in Previous College') {
                _formKey.currentState.validate();
                Global.details.setCourseInPreviousCollege(value);
              } else if (widget.text == '10th Marks') {
                _formKey.currentState.validate();
                Global.details.setTenthMarks(value);
              } else if (widget.text == '12th Marks') {
                _formKey.currentState.validate();
                Global.details.setTwelfthMarks(value);
              } else if (widget.text == 'Marks of Previous College') {
                _formKey.currentState.validate();
                Global.details.setMarksInPreviousCollege(value);
              } else if (widget.text == 'GATE Rank') {
                _formKey.currentState.validate();
                Global.details.setGateRank(value);
              } else if (widget.text == 'CET Rank') {
                _formKey.currentState.validate();
                Global.details.setCetRank(value);
              }
            });
          },
        ),
      ),
    );
  }
}
