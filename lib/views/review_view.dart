import 'package:admission_process/global_variables.dart';
import 'package:admission_process/widgets/text_container.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ReviewView extends StatefulWidget {
  @override
  _ReviewViewState createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  List<Widget> presonalDetailsWidgetList = <Widget>[
    TextContainer(
      text: 'Name : ${Global.details.getName()}',
    ),
    TextContainer(
      text: 'Place of Birth : ${Global.details.getPlaceOfBirth()}',
    ),
    TextContainer(
      text: 'Date of Birth : ${Global.details.getDateOfBirth()}',
    ),
    TextContainer(
      text: 'Religion : ${Global.details.getReligion()}',
    ),
    TextContainer(
      text: 'Caste : ${Global.details.getCaste()}',
    ),
    TextContainer(
      text: 'Nationality : ${Global.details.getNationality()}',
    ),
    TextContainer(
      text: 'Mobile Number : ${Global.details.getMobileNumber()}',
    ),
    TextContainer(
      text: 'Blood Group : ${Global.details.getBloodGroup()}',
    ),
    TextContainer(
      text: 'Mother Tongue : ${Global.details.getMotherTongue()}',
    ),
    TextContainer(
      text:
          'Category of Admission : ${Global.details.getCategoryOfAdmission()}',
    ),
    TextContainer(
      text: 'Address : ${Global.details.getAddress()}',
    ),
  ];

  List<Widget> educationDetailsWidgetList = <Widget>[
    TextContainer(
      text: 'Course : ${Global.details.getCourse()}',
    ),
    TextContainer(
      text: 'Branch : ${Global.details.getBranch()}',
    ),
    TextContainer(
      text: 'Previous College : ${Global.details.getPreviousCollege()}',
    ),
    TextContainer(
      text:
          'Course in Previous College : ${Global.details.getCourseInPreviousCollege()}',
    ),
    TextContainer(
      text: '10th Marks : ${Global.details.getTenthMarks()}',
    ),
    TextContainer(
      text: '12th Marks : ${Global.details.getTwelfthMarks()}',
    ),
    TextContainer(
      text:
          'Marks of Previous College : ${Global.details.getMarksInPreviousCollege()}',
    ),
    TextContainer(
      text: 'GATE Rank : ${Global.details.getGateRank()}',
    ),
    TextContainer(
      text: 'CET Rank : ${Global.details.getCetRank()}',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Text(
            '• Personal Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            child: Column(
              children: [
                (mediaSize.width <= 600)
                    ? Column(
                        children: List.generate(
                            3, (index) => presonalDetailsWidgetList[index]),
                      )
                    : Row(
                        children: List.generate(
                            3,
                            (index) => Expanded(
                                child: presonalDetailsWidgetList[index])),
                      ),
                SizedBox(
                  height: 3.0,
                ),
                (mediaSize.width <= 600)
                    ? Column(
                        children: List.generate(
                            3, (index) => presonalDetailsWidgetList[index + 3]),
                      )
                    : Row(
                        children: List.generate(
                            3,
                            (index) => Expanded(
                                child: presonalDetailsWidgetList[index + 3])),
                      ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  children: [Expanded(child: presonalDetailsWidgetList[6])],
                ),
                SizedBox(
                  height: 3.0,
                ),
                (mediaSize.width <= 600)
                    ? Column(
                        children: List.generate(
                            3, (index) => presonalDetailsWidgetList[index + 7]),
                      )
                    : Row(
                        children: List.generate(
                            3,
                            (index) => Expanded(
                                child: presonalDetailsWidgetList[index + 7])),
                      ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  children: [Expanded(child: presonalDetailsWidgetList[10])],
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
                      Text(
                        '• Father Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        ),
                      ),
                      TextContainer(
                        text: 'Father Name : ${Global.details.getFatherName()}',
                      ),
                      TextContainer(
                        text:
                            'Father Mobile Number : ${Global.details.getFatherMobileNumber()}',
                      ),
                      TextContainer(
                        text:
                            'Father Email ID : ${Global.details.getFatherEmail()}',
                      ),
                      TextContainer(
                        text:
                            'Father Income : ${Global.details.getFatherIncome()}',
                      ),
                      TextContainer(
                        text:
                            'Father Occupation : ${Global.details.getFatherOccupation()}',
                      ),
                      TextContainer(
                        text:
                            'Father Address : ${Global.details.getFatherAddress()}',
                      ),
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
                      Text(
                        '• Mother Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        ),
                      ),
                      TextContainer(
                        text: 'Mother Name : ${Global.details.getMotherName()}',
                      ),
                      TextContainer(
                        text:
                            'Mother Number : ${Global.details.getMotherMobileNumber()}',
                      ),
                      TextContainer(
                        text:
                            'Mother Email ID : ${Global.details.getMotherEmail()}',
                      ),
                      TextContainer(
                        text:
                            'Mother Income : ${Global.details.getMotherIncome()}',
                      ),
                      TextContainer(
                        text:
                            'Mother Occupation : ${Global.details.getMotherOccupation()}',
                      ),
                      TextContainer(
                        text:
                            'Mother Address : ${Global.details.getMotherAddress()}',
                      ),
                    ],
                  ),
                ),
              ),
              if (Global.details.showGuardian())
                Expanded(
                  child: Container(
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
                        TextContainer(
                          text:
                              'Guardian Name : ${Global.details.getGuardianName()}',
                        ),
                        TextContainer(
                          text:
                              'Guardian Mobile Number : ${Global.details.getGuardianMobileNumber()}',
                        ),
                        TextContainer(
                          text:
                              'Guardian Email ID : ${Global.details.getGuardianEmail()}',
                        ),
                        TextContainer(
                          text:
                              'Guardian Income : ${Global.details.getGuardianIncome()}',
                        ),
                        TextContainer(
                          text:
                              'Guardian Occupation : ${Global.details.getGuardianOccupation()}',
                        ),
                        TextContainer(
                          text:
                              'Guardian Address : ${Global.details.getGuardianAddress()}',
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2.0,
                  )),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  '• Education Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
              ),
              (mediaSize.width < 800)
                  ? Column(
                      children: List.generate(
                          2, (index) => educationDetailsWidgetList[index]),
                    )
                  : Row(
                      children: List.generate(
                          2,
                          (index) => Expanded(
                              child: educationDetailsWidgetList[index])),
                    ),
              SizedBox(
                height: 10.0,
              ),
              (mediaSize.width < 800)
                  ? Column(
                      children: List.generate(
                          2, (index) => educationDetailsWidgetList[index + 2]),
                    )
                  : Row(
                      children: List.generate(
                          2,
                          (index) => Expanded(
                              child: educationDetailsWidgetList[index + 2])),
                    ),
              SizedBox(
                height: 10.0,
              ),
              (mediaSize.width < 800)
                  ? Column(
                      children: List.generate(
                          3, (index) => educationDetailsWidgetList[index + 5]),
                    )
                  : Row(
                      children: List.generate(
                          3,
                          (index) => Expanded(
                              child: educationDetailsWidgetList[index + 5])),
                    ),
              SizedBox(
                height: 10.0,
              ),
              (mediaSize.width < 800)
                  ? Column(
                      children: List.generate(
                          2, (index) => educationDetailsWidgetList[index + 7]),
                    )
                  : Row(
                      children: List.generate(
                          2,
                          (index) => Expanded(
                              child: educationDetailsWidgetList[index + 7])),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
