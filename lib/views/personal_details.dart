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
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: MyTextFormField(text: 'Name', editingController: Global.nameEditingController,),),
              Expanded(child: MyTextFormField(text: 'Place of Birth', editingController: Global.pobEditingController,),),
              Expanded(child: MyDatePicker(),),
            ],
          ),
          Row(
            children: [
              Expanded(child: MyTextFormField(text: 'Nationality', editingController: Global.nationalityEditingController,),),
              Expanded(child: MyTextFormField(text: 'Religion', editingController: Global.religionEditingController,),),
              Expanded(child: MyTextFormField(text: 'Caste', editingController: Global.casteEditingController,),),
            ],
          ),
          Row(
            children: [
              Expanded(child: MyTextFormField(text: 'Blood Group', editingController: Global.bldgEditingController,),),
              Expanded(child: MyTextFormField(text: 'Mother Tongue', editingController: Global.mtEditingController,),),
              Expanded(child: MyTextFormField(text: 'Mobile Number', editingController: Global.mobileNumberEditingController,),),
            ],
          ),
          Row(
            children: [
              Expanded(child: MyTextFormField(text: 'Permanent Address', editingController: Global.addressEditingController,),),
            ],
          ),
          Row(
            children: [
              Expanded(child: MyTextFormField(text: '10th Marks', editingController: Global.tenthEditingController,),),
              Expanded(child: MyTextFormField(text: '12th Marks', editingController: Global.twelfthEditingController,),),
              Expanded(child: MyTextFormField(text: 'Marks of Previous College', editingController: Global.mpcEditingController,),),
              Expanded(child: MyTextFormField(text: 'GATE Rank', editingController: Global.gateEditingController,),),
              Expanded(child: MyTextFormField(text: 'CET Rank', editingController: Global.cetEditingController,),),
            ],
          ),
          Row(
            children: [
              Expanded(child: MyTextFormField(text: 'Branch', editingController: Global.branchEditingController,),),
              Expanded(child: MyTextFormField(text: 'Previous College', editingController: Global.pcEditingController,),),
              Expanded(child: MyTextFormField(text: 'Course in Previous College', editingController: Global.cpcEditingController,),),
              Expanded(child: CategoryDropDown(text: 'Course',),),
              Expanded(child: CategoryDropDown(text: 'Category of Admission',),),
            ],
          ),
        ],
      ),
    );
  }
}
