import 'package:flutter/material.dart';
import 'package:admission_process/global_variables.dart';
import 'package:admission_process/widgets/date_picker.dart';
import 'package:admission_process/widgets/dropdown.dart';
import 'package:admission_process/widgets/text_form_field.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;

    List<Widget> widgetList = <Widget>[
      MyTextFormField(
        text: '10th Marks',
        editingController: Global.tenthEditingController,
      ),
      MyTextFormField(
        text: '12th Marks',
        editingController: Global.twelfthEditingController,
      ),
      MyTextFormField(
        text: 'Marks of Previous College',
        editingController: Global.mpcEditingController,
      ),
      MyTextFormField(
        text: 'GATE Rank',
        editingController: Global.gateEditingController,
      ),
      MyTextFormField(
        text: 'CET Rank',
        editingController: Global.cetEditingController,
      ),
      MyTextFormField(
        text: 'Branch',
        editingController: Global.branchEditingController,
      ),
      MyTextFormField(
        text: 'Previous College',
        editingController: Global.pcEditingController,
      ),
      MyTextFormField(
        text: 'Course in Previous College',
        editingController: Global.cpcEditingController,
      ),
      CategoryDropDown(
        text: 'Course',
      ),
      CategoryDropDown(
        text: 'Category of Admission',
      ),
    ];

    return Container(
      child: Column(
        children: [
          (mediaSize.width < 600)
              ? Column(children: [
                  MyTextFormField(
                    text: 'Name',
                    editingController: Global.nameEditingController,
                  ),
                  MyTextFormField(
                    text: 'Place of Birth',
                    editingController: Global.pobEditingController,
                  ),
                  MyDatePicker(),
                ])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Expanded(
                        child: MyTextFormField(
                          text: 'Name',
                          editingController: Global.nameEditingController,
                        ),
                      ),
                      Expanded(
                        child: MyTextFormField(
                          text: 'Place of Birth',
                          editingController: Global.pobEditingController,
                        ),
                      ),
                      Expanded(child: MyDatePicker()),
                    ]),
          (mediaSize.width < 600)
              ? Column(children: [
                  MyTextFormField(
                    text: 'Nationality',
                    editingController: Global.nationalityEditingController,
                  ),
                  MyTextFormField(
                    text: 'Religion',
                    editingController: Global.religionEditingController,
                  ),
                  MyTextFormField(
                    text: 'Caste',
                    editingController: Global.casteEditingController,
                  ),
                ])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Expanded(
                        child: MyTextFormField(
                          text: 'Nationality',
                          editingController:
                              Global.nationalityEditingController,
                        ),
                      ),
                      Expanded(
                        child: MyTextFormField(
                          text: 'Religion',
                          editingController: Global.religionEditingController,
                        ),
                      ),
                      Expanded(
                        child: MyTextFormField(
                          text: 'Caste',
                          editingController: Global.casteEditingController,
                        ),
                      ),
                    ]),
          (mediaSize.width < 600)
              ? Column(children: [
                  MyTextFormField(
                    text: 'Blood Group',
                    editingController: Global.bldgEditingController,
                  ),
                  MyTextFormField(
                    text: 'Mother Tongue',
                    editingController: Global.mtEditingController,
                  ),
                  MyTextFormField(
                    text: 'Mobile Number',
                    editingController: Global.mobileNumberEditingController,
                  ),
                ])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Expanded(
                        child: MyTextFormField(
                          text: 'Blood Group',
                          editingController: Global.bldgEditingController,
                        ),
                      ),
                      Expanded(
                        child: MyTextFormField(
                          text: 'Mother Tongue',
                          editingController: Global.mtEditingController,
                        ),
                      ),
                      Expanded(
                        child: MyTextFormField(
                          text: 'Mobile Number',
                          editingController:
                              Global.mobileNumberEditingController,
                        ),
                      ),
                    ]),
          Row(
            children: [
              Expanded(
                child: MyTextFormField(
                  text: 'Permanent Address',
                  editingController: Global.addressEditingController,
                ),
              ),
            ],
          ),
          (mediaSize.width <= 800)
              ? Column(children: widgetList)
              : (mediaSize.width > 800 && mediaSize.width <= 1080)
                  ? Column(
                      children: [
                        Row(
                          children: List.generate(
                              4, (index) => Expanded(child: widgetList[index])),
                        ),
                        Row(
                          children: List.generate(
                              4,
                              (index) =>
                                  Expanded(child: widgetList[index + 4])),
                        ),
                        Row(
                          children: List.generate(
                              2,
                              (index) =>
                                  Expanded(child: widgetList[index + 8])),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: List.generate(
                              5, (index) => Expanded(child: widgetList[index])),
                        ),
                        Row(
                          children: List.generate(
                              5,
                              (index) =>
                                  Expanded(child: widgetList[index + 5])),
                        ),
                      ],
                    )
        ],
      ),
    );
  }
}
