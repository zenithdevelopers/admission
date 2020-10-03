import 'package:admission_process/global_variables.dart';
import 'package:admission_process/widgets/text_container.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ReviewView extends StatefulWidget {
  @override
  _ReviewViewState createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('• Personal Details', style: TextStyle(color: Colors.black, fontSize: 24.0,),),
          Container(
            margin: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: TextContainer(text: 'Name : ${Global.details.getName()}',)),
                    Expanded(child: TextContainer(text: 'Place of Birth : ${Global.details.getPlaceOfBirth()}',)),
                    Expanded(child: TextContainer(text: 'Date of Birth : ${Global.details.getDateOfBirth()}',))
                  ],
                ),
                SizedBox(height: 3.0,),
                Row(
                  children: [
                    Expanded(child: TextContainer(text: 'Religion : ${Global.details.getReligion()}',)),
                    Expanded(child: TextContainer(text: 'Caste : ${Global.details.getCaste()}',)),
                    Expanded(child: TextContainer(text: 'Nationality : ${Global.details.getNationality()}',)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: SizedBox(width: 1.0,)),
                    Expanded(child: TextContainer(text: 'Mobile Number : ${Global.details.getMobileNumber()}',)),
                    Expanded(child: SizedBox(width: 1.0,)),
                  ],
                ),
                SizedBox(height: 3.0,),
                Row(
                  children: [
                    Expanded(child: TextContainer(text: 'Blood Group : ${Global.details.getBloodGroup()}',)),
                    Expanded(child: TextContainer(text: 'Mother Tongue : ${Global.details.getMotherTongue()}',)),
                    Expanded(child: TextContainer(text: 'Category of Admission : ${Global.details.getCategoryOfAdmission()}',)),
                  ],
                ),
                SizedBox(height: 3.0,),
                Row(
                  children: [
                    Expanded(child: TextContainer(text: 'Address : ${Global.details.getAddress()}',)),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
// decoration: leftBoxDecoration,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('• Father Details', style: TextStyle(color: Colors.black, fontSize: 24.0,),),
                      TextContainer(text: 'Father Name : ${Global.details.getFatherName()}',),
                      TextContainer(text: 'Father Mobile Number : ${Global.details.getFatherMobileNumber()}',),
                      TextContainer(text: 'Father Email ID : ${Global.details.getFatherEmail()}',),
                      TextContainer(text: 'Father Income : ${Global.details.getFatherIncome()}',),
                      TextContainer(text: 'Father Occupation : ${Global.details.getFatherOccupation()}',),
                      TextContainer(text: 'Father Address : ${Global.details.getFatherAddress()}',),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
// decoration: rightBoxDecoration,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('• Mother Details', style: TextStyle(color: Colors.black, fontSize: 24.0,),),
                      TextContainer(text: 'Mother Name : ${Global.details.getMotherName()}',),
                      TextContainer(text: 'Mother Number : ${Global.details.getMotherMobileNumber()}',),
                      TextContainer(text: 'Mother Email ID : ${Global.details.getMotherEmail()}',),
                      TextContainer(text: 'Mother Income : ${Global.details.getMotherIncome()}',),
                      TextContainer(text: 'Mother Occupation : ${Global.details.getMotherOccupation()}',),
                      TextContainer(text: 'Mother Address : ${Global.details.getMotherAddress()}',),
                    ],
                  ),
                ),
              ),
              if(Global.details.showGuardian())
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('• Guardian Details (Optional)', style: TextStyle(color: Colors.black, fontSize: 24.0,),),
                        TextContainer(text: 'Guardian Name : ${Global.details.getGuardianName()}',),
                        TextContainer(text: 'Guardian Mobile Number : ${Global.details.getGuardianMobileNumber()}',),
                        TextContainer(text: 'Guardian Email ID : ${Global.details.getGuardianEmail()}',),
                        TextContainer(text: 'Guardian Income : ${Global.details.getGuardianIncome()}',),
                        TextContainer(text: 'Guardian Occupation : ${Global.details.getGuardianOccupation()}',),
                        TextContainer(text: 'Guardian Address : ${Global.details.getGuardianAddress()}',),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Column(
            children: [
              Container(margin: EdgeInsets.all(10.0),child: Divider(color: Colors.black, thickness: 2.0,)),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text('• Education Details', style: TextStyle(color: Colors.black, fontSize: 24.0,),),
              ),
              Row(
                children: [
                  Expanded(child: TextContainer(text: 'Course : ${Global.details.getCourse()}',)),
                  Expanded(child: TextContainer(text: 'Branch : ${Global.details.getBranch()}',),),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(child: TextContainer(text: 'Previous College : ${Global.details.getPreviousCollege()}',)),
                  Expanded(child: TextContainer(text: 'Course in Previous College : ${Global.details.getCourseInPreviousCollege()}',)),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(child: TextContainer(text: '10th Marks : ${Global.details.getTenthMarks()}',)),
                  Expanded(child: TextContainer(text: '12th Marks : ${Global.details.getTwelfthMarks()}',)),
                  Expanded(child: TextContainer(text: 'Marks of Previous College : ${Global.details.getMarksInPreviousCollege()}',)),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(child: TextContainer(text: 'GATE Rank : ${Global.details.getGateRank()}',)),
                  Expanded(child: TextContainer(text: 'CET Rank : ${Global.details.getCetRank()}',)),
                ],
              ),
            ],
          )
        ],
      ),
    );

  }
}
