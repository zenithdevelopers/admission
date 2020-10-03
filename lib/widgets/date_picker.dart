import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:admission_process/global_variables.dart';

// ignore: must_be_immutable
class MyDatePicker extends StatelessWidget {
  final format = DateFormat("dd-MM-yyyy");
  Future<DateTime> dateTime;
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      controller: Global.dateEditingController,
      format: format,
      onShowPicker: (context, currentValue) {
        dateTime = showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
        );
        dateTime.then((value) => Global.details.setDateOfBirth(date(value)));
        return dateTime;
      },
      decoration: InputDecoration(
          hintText: 'Select Date of Birth',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.5),
          ),
          labelText: 'Date of Birth',
          suffixIcon: Icon(Icons.date_range),
      ),
    );
  }

  String date(DateTime tm) {
    String day;
    String month;
    switch (tm.month) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }

    switch (tm.day) {
      case 1:
        day = "1st";
        break;
      case 2:
        day = "2nd";
        break;
      case 3:
        day = "3rd";
        break;
      case 4:
        day = "4th";
        break;
      case 5:
        day = "5th";
        break;
      case 6:
        day = "6th";
        break;
      case 7:
        day = "7th";
        break;
      case 8:
        day = "8th";
        break;
      case 9:
        day = "9th";
        break;
      case 10:
        day = "10th";
        break;
      case 11:
        day = "11th";
        break;
      case 12:
        day = "12th";
        break;
      case 13:
        day = "13th";
        break;
      case 14:
        day = "14th";
        break;
      case 15:
        day = "15th";
        break;
      case 16:
        day = "16th";
        break;
      case 17:
        day = "17th";
        break;
      case 18:
        day = "18th";
        break;
      case 19:
        day = "19th";
        break;
      case 20:
        day = "20th";
        break;
      case 21:
        day = "21st";
        break;
      case 22:
        day = "22nd";
        break;
      case 23:
        day = "23rd";
        break;
      case 24:
        day = "24th";
        break;
      case 25:
        day = "25th";
        break;
      case 26:
        day = "26th";
        break;
      case 27:
        day = "27th";
        break;
      case 28:
        day = "28th";
        break;
      case 29:
        day = "29th";
        break;
      case 30:
        day = "30th";
        break;
      case 31:
        day = "31st";
        break;
    }
    return day + ', ' + month + ', ${tm.year}';
  }
}
