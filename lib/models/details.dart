class Details {
  String name;
  String dateOfBirth;
  String placeOfBirth;
  String nationality;
  String religion;
  String caste;
  String bloodGroup;
  String motherTongue;
  String address;
  String mobileNumber;
  String categoryOfAdmission;

  String fatherName;
  String fatherMobileNumber;
  String fatherEmail;
  String fatherIncome;
  String fatherOccupation;
  String fatherAddress;

  String motherName;
  String motherMobileNumber;
  String motherEmail;
  String motherIncome;
  String motherOccupation;
  String motherAddress;

  String guardianName;
  String guardianMobileNumber;
  String guardianEmail;
  String guardianIncome;
  String guardianOccupation;
  String guardianAddress;

  String course;
  String branch;
  String previousCollege;
  String courseInPreviousCollege;
  String marksInPreviousCollege;
  String tenthMarks;
  String twelfthMarks;
  String gateRank;
  String cetRank;

  String dateOfBirthDocument;
  String identityProof;
  String addressProof;
  String tenthMarkSheet;
  String twelfthMarkSheet;
  String gateRankProof;
  String cetRankProof;
  String ugCertificate;
  String transferCertificate;
  String citizenProofIfForeigner;

  Details(
      {this.name,
        this.dateOfBirth,
        this.placeOfBirth,
        this.nationality,
        this.religion,
        this.caste,
        this.bloodGroup,
        this.motherTongue,
        this.address,
        this.mobileNumber,
        this.categoryOfAdmission,

        this.fatherName,
        this.fatherMobileNumber,
        this.fatherEmail,
        this.fatherIncome,
        this.fatherOccupation,
        this.fatherAddress,

        this.motherName,
        this.motherMobileNumber,
        this.motherEmail,
        this.motherIncome,
        this.motherOccupation,
        this.motherAddress,

        this.guardianName,
        this.guardianMobileNumber,
        this.guardianEmail,
        this.guardianIncome,
        this.guardianOccupation,
        this.guardianAddress,

        this.course,
        this.branch,
        this.previousCollege,
        this.courseInPreviousCollege,
        this.marksInPreviousCollege,
        this.tenthMarks,
        this.twelfthMarks,
        this.gateRank,
        this.cetRank,

        this.dateOfBirthDocument,
        this.identityProof,
        this.addressProof,
        this.tenthMarkSheet,
        this.twelfthMarkSheet,
        this.gateRankProof,
        this.cetRankProof,
        this.transferCertificate,
        this.ugCertificate,
        this.citizenProofIfForeigner
      });


  String getName() {if (this.name != null) {return this.name;} else {return 'name not set';}}

  void setName(String mName) {this.name = mName;}

  String getDateOfBirth() {if (this.dateOfBirth != null) {return this.dateOfBirth;} else {return 'dateOfBirth not set';}}

  void setDateOfBirth(String mDateOfBirth) {this.dateOfBirth = mDateOfBirth;}

  String getPlaceOfBirth() {if (this.placeOfBirth != null) {return this.placeOfBirth;} else { return 'placeOfBirth not set';}}

  void setPlaceOfBirth(String mPlaceOfBirth) {this.placeOfBirth = mPlaceOfBirth;}

  String getNationality() {if (this.nationality != null) {return this.nationality;} else {return 'nationality not set';}}

  void setNationality(String mNationality) {this.nationality = mNationality;}

  String getReligion() {if (this.religion != null) {return this.religion;} else {return 'religion not set';}}

  void setReligion(String mReligion) {this.religion = mReligion;}

  String getCaste() {if (this.caste != null) {return this.caste;} else {return 'caste not set';}}

  void setCaste(String mCaste) {this.caste = mCaste;}

  String getBloodGroup() {if (this.bloodGroup != null) {return this.bloodGroup;} else {return 'bloodGroup not set';}}

  void setBloodGroup(String mBloodGroup) {this.bloodGroup = mBloodGroup;}

  String getMotherTongue() {if (this.motherTongue != null) {return this.motherTongue;} else {return 'motherTongue not set';}}

  void setMotherTongue(String mMotherTongue) {this.motherTongue = mMotherTongue;}

  String getAddress() {if (this.address != null) {return this.address;} else {return 'address not set';}}

  void setAddress(String mAddress) {this.address = mAddress;}

  String getMobileNumber() {if (this.mobileNumber != null) {return this.mobileNumber;} else {return 'mobileNumber not set';}}

  void setMobileNumber(String mMobileNumber) {this.mobileNumber = mMobileNumber;}

  String getCategoryOfAdmission() {if (this.categoryOfAdmission != null) {return this.categoryOfAdmission;} else {return 'categoryOfAdmission not set';}}

  void setCategoryOfAdmission(String mCategoryOfAdmission) {this.categoryOfAdmission = mCategoryOfAdmission;}

  String getFatherName() {if (this.fatherName != null) {return this.fatherName;} else {return 'fatherName not set';}}

  void setFatherName(String mFatherName) {this.fatherName = mFatherName;}

  String getFatherMobileNumber() {if (this.fatherMobileNumber != null) {return this.fatherMobileNumber;} else {return 'fatherMobileNumber not set';}}

  void setFatherMobileNumber(String mFatherMobileNumber) {this.fatherMobileNumber = mFatherMobileNumber;}

  String getFatherEmail() {if (this.fatherEmail != null) {return this.fatherEmail;} else {return 'fatherEmail not set';}}

  void setFatherEmail(String mFatherEmail) {this.fatherEmail = mFatherEmail;}

  String getFatherIncome() {if (this.fatherIncome != null) {return this.fatherIncome;} else {return 'fatherIncome not set';}}

  void setFatherIncome(String mFatherIncome) {this.fatherIncome = mFatherIncome;}

  String getFatherOccupation() {if (this.fatherOccupation != null) {return this.fatherOccupation;} else {return 'fatherOccupation not set';}}

  void setFatherOccupation(String mFatherOccupation) {this.fatherOccupation = mFatherOccupation;}

  String getFatherAddress() {if (this.fatherAddress != null) {return this.fatherAddress;} else {return 'fatherAddress not set';}}

  void setFatherAddress(String mFatherAddress) {this.fatherAddress = mFatherAddress;}

  String getMotherName() {if (this.motherName != null) {return this.motherName;} else {return 'motherName not set';}}

  void setMotherName(String mMotherName) {this.motherName = mMotherName;}

  String getMotherMobileNumber() {if (this.motherMobileNumber != null) {return this.motherMobileNumber;} else {return 'motherMobileNumber not set';}}

  void setMotherMobileNumber(String mMotherMobileNumber) {this.motherMobileNumber = mMotherMobileNumber;}

  String getMotherEmail() {if (this.motherEmail != null) {return this.motherEmail;} else {return 'motherEmail not set';}}

  void setMotherEmail(String mMotherEmail) {this.motherEmail = mMotherEmail;}

  String getMotherIncome() {if (this.motherIncome != null) {return this.motherIncome;} else {return 'motherIncome not set';}}

  void setMotherIncome(String mMotherIncome) {this.motherIncome = mMotherIncome;}

  String getMotherOccupation() {if (this.motherOccupation != null) {return this.motherOccupation;} else {return 'motherOccupation not set';}}

  void setMotherOccupation(String mMotherOccupation) {this.motherOccupation = mMotherOccupation;}

  String getMotherAddress() {if (this.motherAddress != null) {return this.motherAddress;} else {return 'motherAddress not set';}}

  void setMotherAddress(String mMotherAddress) {this.motherAddress = mMotherAddress;}

  String getGuardianName() {if (this.guardianName != null) {return this.guardianName;} else {return 'guardianName not set';}}

  void setGuardianName(String mGuardianName) {this.guardianName = mGuardianName;}

  String getGuardianMobileNumber() {if (this.guardianMobileNumber != null) {return this.guardianMobileNumber;} else {return 'guardianMobileNumber not set';}}

  void setGuardianMobileNumber(String mGuardianMobileNumber) {this.guardianMobileNumber = mGuardianMobileNumber;}

  String getGuardianEmail() {if (this.guardianEmail != null) {return this.guardianEmail;} else {return 'guardianEmail not set';}}

  void setGuardianEmail(String mGuardianEmail) {this.guardianEmail = mGuardianEmail;}

  String getGuardianIncome() {if (this.guardianIncome != null) {return this.guardianIncome;} else {return 'guardianIncome not set';}}

  void setGuardianIncome(String mGuardianIncome) {this.guardianIncome = mGuardianIncome;}

  String getGuardianOccupation() {if (this.guardianOccupation != null) {return this.guardianOccupation;} else {return 'guardianOccupation not set';}}

  void setGuardianOccupation(String mGuardianOccupation) {this.guardianOccupation = mGuardianOccupation;}

  String getGuardianAddress() {if (this.guardianAddress != null) {return this.guardianAddress;} else {return 'guardianAddress not set';}}

  void setGuardianAddress(String mGuardianAddress) {this.guardianAddress = mGuardianAddress;}

  String getCourse() {if (this.course != null) {return this.course;} else {return 'course not set';}}

  void setCourse(String mCourse) {this.course = mCourse;}

  String getBranch() {if (this.branch != null) {return this.branch;} else {return 'branch not set';}}

  void setBranch(String mBranch) {this.branch = mBranch;}

  String getPreviousCollege() {if (this.previousCollege != null) {return this.previousCollege;} else {return 'previousCollege not set';}}

  void setPreviousCollege(String mPreviousCollege) {this.previousCollege = mPreviousCollege;}

  String getCourseInPreviousCollege() {if (this.courseInPreviousCollege != null) {return this.courseInPreviousCollege;} else {return 'courseInPreviousCollege not set';}}

  void setCourseInPreviousCollege(String mCourseInPreviousCollege) {this.courseInPreviousCollege = mCourseInPreviousCollege;}

  String getMarksInPreviousCollege() {if (this.marksInPreviousCollege != null) {return this.marksInPreviousCollege;} else {return 'marksInPreviousCollege not set';}}

  void setMarksInPreviousCollege(String mMarksInPreviousCollege) {this.marksInPreviousCollege = mMarksInPreviousCollege;}

  String getTenthMarks() {if (this.tenthMarks != null) {return this.tenthMarks;} else {return 'tenthMarks not set';}}

  void setTenthMarks(String mTenthMarks) {this.tenthMarks = mTenthMarks;}

  String getTwelfthMarks() {if (this.twelfthMarks != null) {return this.twelfthMarks;} else {return 'twelfthMarks not set';}}

  void setTwelfthMarks(String mTwelfthMarks) {this.twelfthMarks = mTwelfthMarks;}

  String getGateRank() {if (this.gateRank != null) {return this.gateRank;} else {return 'gateRank not set';}}

  void setGateRank(String mGateRank) {this.gateRank = mGateRank;}

  String getCetRank() {if (this.cetRank != null) {return this.cetRank;} else {return 'cetRank not set';}}

  void setCetRank(String mCetRank) {this.cetRank = mCetRank;}


  String getDateOfBirthDocument() {if (this.dateOfBirthDocument != null) {return this.dateOfBirthDocument;} else {return 'dateOfBirthDocument not set';}}

  void setDateOfBirthDocument(String mDateOfBirthDocument) {this.dateOfBirthDocument = mDateOfBirthDocument;}

  String getIdentityProof() {if (this.identityProof != null) {return this.identityProof;} else {return 'identityProof not set';}}

  void setIdentityProof(String mIdentityProof) {this.identityProof = mIdentityProof;}

  String getAddressProof() {if (this.addressProof != null) {return this.addressProof;} else { return 'addressProof not set';}}

  void setAddressProof(String mAddressProof) {this.addressProof = mAddressProof;}

  String getTenthMarkSheet() {if (this.tenthMarkSheet != null) {return this.tenthMarkSheet;} else {return 'tenthMarkSheet not set';}}

  void setTenthMarkSheet(String mTenthMarkSheet) {this.tenthMarkSheet = mTenthMarkSheet;}

  String getTwelfthMarkSheet() {if (this.twelfthMarkSheet != null) {return this.twelfthMarkSheet;} else {return 'twelfthMarkSheet not set';}}

  void setTwelfthMarkSheet(String mTwelfthMarkSheet) {this.twelfthMarkSheet = mTwelfthMarkSheet;}

  String getGateRankProof() {if (this.gateRankProof != null) {return this.gateRankProof;} else {return 'gateRankProof not set';}}

  void setGateRankProof(String mGateRankProof) {this.gateRankProof = mGateRankProof;}

  String getCetRankProof() {if (this.cetRankProof != null) {return this.cetRankProof;} else {return 'cetRankProof not set';}}

  void setCetRankProof(String mCetRankProof) {this.cetRankProof = mCetRankProof;}

  String getTransferCertificate() {if (this.transferCertificate != null) {return this.transferCertificate;} else {return 'transferCertificate not set';}}

  void setTransferCertificate(String mTransferCertificate) {this.transferCertificate = mTransferCertificate;}

  String getUgCertificate() {if (this.ugCertificate != null) {return this.ugCertificate;} else {return 'ugCertificate not set';}}

  void setUgCertificate(String mUgCertificate) {this.ugCertificate = mUgCertificate;}

  String getCitizenProofIfForeigner() {if (this.citizenProofIfForeigner != null) {return this.citizenProofIfForeigner;} else {return 'citizenProofIfForeigner not set';}}

  void setCitizenProofIfForeigner(String mCitizenProofIfForeigner) {this.citizenProofIfForeigner = mCitizenProofIfForeigner;}


  bool showGuardian() {
    if (guardianName != null && guardianMobileNumber != null && guardianEmail != null &&
        guardianIncome != null && guardianOccupation != null && guardianAddress != null) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'branch': dateOfBirth,
      'placeOfBirth': placeOfBirth,
      'nationality': nationality,
      'religion': religion,
      'caste': caste,
      'bloodGroup': bloodGroup,
      'motherTongue': motherTongue,
      'address': address,
      'mobileNumber': mobileNumber,
      'categoryOfAdmission': categoryOfAdmission,

      'fatherName': fatherName,
      'fatherMobileNumber': fatherMobileNumber,
      'fatherEmail': fatherEmail,
      'fatherIncome': fatherIncome,
      'fatherOccupation': fatherOccupation,
      'fatherAddress': fatherAddress,

      'motherName': motherName,
      'motherMobileNumber': motherMobileNumber,
      'motherEmail': motherEmail,
      'motherIncome': motherIncome,
      'motherOccupation': motherOccupation,
      'motherAddress': motherAddress,

      'guardianName': guardianName,
      'guardianMobileNumber': guardianMobileNumber,
      'guardianEmail': guardianEmail,
      'guardianIncome': guardianIncome,
      'guardianOccupation': guardianOccupation,
      'guardianAddress': guardianAddress,

      'dateOfBirthDocument': dateOfBirthDocument,
      'identityProof': identityProof,
      'addressProof': addressProof,
      'tenthMarkSheet': tenthMarkSheet,
      'twelfthMarkSheet': twelfthMarkSheet,
      'gateRankProof': gateRankProof,
      'cetRankProof': cetRankProof,
      'transferCertificate': transferCertificate,
      'ugCertificate': ugCertificate,
      'citizenProofIfForeigner': citizenProofIfForeigner,

    };
  }

  static Details fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Details(
      name: map['name'],
      dateOfBirth: map['dateOfBirth'],
      placeOfBirth: map['placeOfBirth'],
      nationality: map['nationality'],
      religion: map['religion'],
      caste: map['caste'],
      bloodGroup: map['bloodGroup'],
      motherTongue: map['motherTongue'],
      address: map['address'],
      mobileNumber: map['mobileNumber'],
      categoryOfAdmission: map['categoryOfAdmission'],

      fatherName: map['fatherName'],
      fatherMobileNumber: map['fatherMobileNumber'],
      fatherEmail: map['fatherEmail'],
      fatherIncome: map['fatherIncome'],
      fatherOccupation: map['fatherOccupation'],
      fatherAddress: map['fatherAddress'],

      motherName: map['motherName'],
      motherMobileNumber: map['motherMobileNumber'],
      motherEmail: map['motherEmail'],
      motherIncome: map['motherIncome'],
      motherOccupation: map['motherOccupation'],
      motherAddress: map['motherAddress'],

      guardianName: map['guardianName'],
      guardianMobileNumber: map['guardianMobileNumber'],
      guardianEmail: map['guardianEmail'],
      guardianIncome: map['guardianIncome'],
      guardianOccupation: map['guardianOccupation'],
      guardianAddress: map['guardianAddress'],

      dateOfBirthDocument: map['dateOfBirthDocument'],
      identityProof: map['identityProof'],
      addressProof: map['addressProof'],
      tenthMarkSheet: map['tenthMarkSheet'],
      twelfthMarkSheet: map['twelfthMarkSheet'],
      gateRankProof: map['gateRankProof'],
      cetRankProof: map['cetRankProof'],
      transferCertificate: map['transferCertificate'],
      ugCertificate: map['ugCertificate'],
      citizenProofIfForeigner: map['citizenProofIfForeigner'],

    );
  }
}

