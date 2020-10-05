import 'package:admission_process/global_variables.dart';
import 'package:admission_process/views/documents_view.dart';
import 'package:admission_process/views/parent_details.dart';
import 'package:admission_process/views/personal_details.dart';
import 'package:admission_process/views/review_view.dart';
import 'package:admission_process/views/submitted_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'custom_stepper.dart';

class MyStepper extends StatefulWidget {
  final Size mediaSize;
  MyStepper({this.mediaSize});
  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isVisible = false;
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CustomStepper(
                  type: CustomStepperType.horizontal,
                  steps: steps,
                  currentStep: currentStep,
                  onStepContinue: next,
                  // onStepTapped: (step) => goTo(step),
                  onStepCancel: cancel,
                ),
                _isVisible
                    ? Center(child: CircularProgressIndicator())
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }

  int selectedIndex = 0;

  int currentStep = 0;
  var complete;

  next() {
    if (currentStep + 1 == steps.length) {
      setState(() {
        _isVisible = true;
      });
      if (reviewValidator(context)) {
        firestore
            .collection('Applicant Details')
            .add(Global.details.toMap())
            .whenComplete(() =>
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      _isVisible = false;
                      return SubmittedView();
                    },
                  ),
                ));
      }
    } else {
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
      steps[currentStep + 1].isActive = false;
      steps[currentStep].state = CustomStepState.disabled;
      if (currentStep == 0) {
        steps[currentStep].setLineColor1(Colors.grey);
      }
      if (currentStep == 1) {
        steps[currentStep].setLineColor2(Colors.grey);
      }
      if (currentStep == 2) {
        steps[currentStep].setLineColor3(Colors.grey);
      }
      if (currentStep == 3) {
        steps[currentStep].setLineColor4(Colors.grey);
      }
    }
  }

  goTo(int step) {
    setState(() {
      currentStep = step;
      steps[currentStep].isActive = true;
      steps[currentStep].setVisibility(true);
      if (currentStep > 0) {
        steps[currentStep - 1].state = CustomStepState.complete;
      }
      if (currentStep == 0) {
        steps[currentStep].setVisibility(false);
        steps[currentStep].setNextButtonText('Next');
      }
      if (currentStep - 1 == 0) {
        steps[currentStep].setLineColor1(Colors.blue);
        steps[currentStep].setNextButtonText('Next');
      }
      if (currentStep - 1 == 1) {
        steps[currentStep].setLineColor2(Colors.blue);
        steps[currentStep].setNextButtonText('Next');
        steps[currentStep].setVisibility(true);
      }
      if (currentStep - 1 == 2) {
        steps[currentStep].setLineColor3(Colors.blue);
        steps[currentStep].setNextButtonText('Next');
        steps[currentStep].setVisibility(true);
      }
      if (currentStep == 3) {
        steps[currentStep].setNextButtonText('Verify and Submit');
        steps[currentStep].setVisibility(true);
      }
    });
  }

  List<CustomStep> steps = [
    CustomStep(
      title: Text(
        'Personal Details',
        style: TextStyle(fontSize: 14),
      ),
      isActive: true,
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: PersonalDetails(),
      ),
    ),
    CustomStep(
      title: Text('Parent Details'),
      isActive: false,
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ParentDetails(),
      ),
    ),
    CustomStep(
      title: Text('Documents'),
      isActive: false,
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: DocumentsView(),
      ),
    ),
    CustomStep(
      title: Text('Review'),
      isActive: false,
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ReviewView(),
      ),
    )
  ];

  bool reviewValidator(BuildContext context) {
    bool val = true;
    if (Global.details.getName() == 'name not set') {
      setState(() {
        showToast('Name can not be empty, Enter Name');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getDateOfBirth() == 'dateOfBirth not set') {
      setState(() {
        showToast('Date of Birth can not be empty, Enter Date of Birth');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getPlaceOfBirth() == 'placeOfBirth not set') {
      setState(() {
        showToast(
            'Place of Birth not set can not be empty, Enter Place of Birth');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getNationality() == 'nationality not set') {
      setState(() {
        showToast('Nationality can not be empty, Enter Nationality');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getReligion() == 'religion not set') {
      setState(() {
        showToast('Religion can not be empty, Enter Religion');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getCaste() == 'caste not set') {
      setState(() {
        showToast('Caste can not be empty, Enter Caste');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getBloodGroup() == 'bloodGroup not set') {
      setState(() {
        showToast('Blood Group can not be empty, Enter Blood Group');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getMotherTongue() == 'motherTongue not set') {
      setState(() {
        showToast('Mother Tongue can not be empty, Enter Mother Tongue');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getAddress() == 'address not set') {
      setState(() {
        showToast('Address can not be empty, Enter Address');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getMobileNumber() == 'mobileNumber not set') {
      setState(() {
        showToast('Mobile Number can not be empty, Enter Mobile Number');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getCategoryOfAdmission() ==
        'categoryOfAdmission not set') {
      setState(() {
        showToast(
            'Category of Admission can not be empty, Choose Category of Admission');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getFatherName() == 'fatherName not set') {
      setState(() {
        showToast('Father Name can not be empty, Enter Father Name');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getFatherMobileNumber() ==
        'fatherMobileNumber not set') {
      setState(() {
        showToast(
            'Father Mobile Number can not be empty, Enter Father Mobile Number');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getFatherEmail() == 'fatherEmail not set') {
      setState(() {
        showToast('Father Email can not be empty, Enter Father Email');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getFatherIncome() == 'fatherIncome not set') {
      setState(() {
        showToast('Father Income can not be empty, Choose Father Income');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getFatherOccupation() == 'fatherOccupation not set') {
      setState(() {
        showToast(
            'Father Occupation can not be empty, Enter Father Occupation');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getFatherAddress() == 'fatherAddress not set') {
      setState(() {
        showToast('Father Address can not be empty, Enter Father Address');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getMotherName() == 'motherName not set') {
      setState(() {
        showToast('Mother Name can not be empty, Enter Mother Name');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getMotherMobileNumber() ==
        'motherMobileNumber not set') {
      setState(() {
        showToast(
            'Mother Mobile Number can not be empty, Enter Mother Mobile Number');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getMotherEmail() == 'motherEmail not set') {
      setState(() {
        showToast('Mother Email can not be empty, Enter Mother Email');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getMotherIncome() == 'motherIncome not set') {
      setState(() {
        showToast('Mother Income can not be empty, Choose Mother Income');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getMotherOccupation() == 'motherOccupation not set') {
      setState(() {
        showToast(
            'Mother Occupation can not be empty, Enter Mother Occupation');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getMotherAddress() == 'motherAddress not set') {
      setState(() {
        showToast('Mother Address can not be empty, Enter Mother Address');
        val = false;
        _isVisible = false;
        goTo(1);
      });
    }
    if (Global.details.getCourse() == 'course not set') {
      setState(() {
        showToast('Course can not be empty, Choose Course');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getBranch() == 'branch not set') {
      setState(() {
        showToast('Branch can not be empty, Enter Branch');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getPreviousCollege() == 'previousCollege not set') {
      setState(() {
        showToast('Previous College can not be empty, Enter Previous College');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getCourseInPreviousCollege() ==
        'courseInPreviousCollege not set') {
      setState(() {
        showToast(
            'Course In Previous College can not be empty, Enter Course In Previous College');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getMarksInPreviousCollege() ==
        'marksInPreviousCollege not set') {
      setState(() {
        showToast(
            'Marks in Previous College can not be empty, Enter Marks in Previous College');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getTenthMarks() == 'tenthMarks not set') {
      setState(() {
        showToast('Tenth Marks can not be empty, Enter Tenth Marks');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getTwelfthMarks() == 'twelfthMarks not set') {
      setState(() {
        showToast('Twelfth Marks can not be empty, Enter Twelfth Marks');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getGateRank() == 'gateRank not set') {
      setState(() {
        showToast('Gate Rank can not be empty, Enter Gate Rank');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    if (Global.details.getDateOfBirthDocument() ==
        'dateOfBirthDocument not set') {
      setState(() {
        showToast(
            'Date of Birth Document can not be empty, Upload Date of Birth Document');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getIdentityProof() == 'identityProof not set') {
      setState(() {
        showToast('Identity Proof can not be empty, Upload Identity Proof');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getAddressProof() == 'addressProof not set') {
      setState(() {
        showToast('Address Proof can not be empty, Upload Address Proof');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getTenthMarkSheet() == 'tenthMarkSheet not set') {
      setState(() {
        showToast('Tenth Mark Sheet can not be empty, Upload Tenth Mark Sheet');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getTwelfthMarkSheet() == 'twelfthMarkSheet not set') {
      setState(() {
        showToast(
            'Twelfth Mark Sheet can not be empty, Upload Twelfth Mark Sheet');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getGateRankProof() == 'gateRankProof not set') {
      setState(() {
        showToast('Gate Rank Proof can not be empty, Upload Gate Rank Proof');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getCetRankProof() == 'cetRankProof not set') {
      setState(() {
        showToast('Cet Rank Proof can not be empty, Upload Cet Rank Proof');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getTransferCertificate() ==
        'transferCertificate not set') {
      setState(() {
        showToast(
            'Transfer Certificate can not be empty, Upload Transfer Certificate');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getUgCertificate() == 'ugCertificate not set') {
      setState(() {
        showToast('UG Certificate can not be empty, Upload UG Certificate');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getCitizenProofIfForeigner() ==
        'citizenProofIfForeigner not set') {
      setState(() {
        showToast(
            'Nationality Proof can not be empty, Upload Nationality Proof');
        val = false;
        _isVisible = false;
        goTo(2);
      });
    }
    if (Global.details.getCetRank() == 'cetRank not set') {
      setState(() {
        showToast('Cet Rank can not be empty, Enter Cet Rank');
        val = false;
        _isVisible = false;
        goTo(0);
      });
    }
    return val;
  }

  showToast(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey.shade900,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_amber_outlined,
            color: Colors.yellow,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }
}
