import 'package:admission_process/global_variables.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryDropDown extends StatefulWidget {

  String text;

  CategoryDropDown({Key key, this.text}) : super(key: key);

  @override
  _CategoryDropDownState createState() =>
      _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  List _currency = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"];
  String _currentCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ConstrainedBox(
        constraints:  BoxConstraints(minWidth: double.infinity),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _currentCurrency,
              items: getDropDownMenuCurrencyItems(),
              onChanged: changedDropDownItem,
              hint: Text(widget.text, style: TextStyle(color: Colors.black),),
            ),
          ),
        ),
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5, style: BorderStyle.solid, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropDownMenuCurrencyItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String currency in _currency) {
      items.add(
          new DropdownMenuItem(value: currency, child: new Text(currency),));
    }
    return items;
  }

  void changedDropDownItem(String selectedCurrency) {
    setState(() {
      _currentCurrency = selectedCurrency;
      if (widget.text == 'Category of Admission') {
        Global.details.setCategoryOfAdmission(selectedCurrency);
      } else if (widget.text == 'Father Income') {
        Global.details.setFatherIncome(selectedCurrency);
      } else if (widget.text == 'Mother Income') {
        Global.details.setMotherIncome(selectedCurrency);
      } else if (widget.text == 'Guardian Income') {
        Global.details.setGuardianIncome(selectedCurrency);
      } else if (widget.text == 'Course') {
        Global.details.setCourse(selectedCurrency);
      }
    });
  }
}
