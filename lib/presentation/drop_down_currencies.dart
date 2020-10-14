import 'package:flutter/material.dart';

class DropDownType extends StatefulWidget {
  @override
  _DropDownTypeState createState() => _DropDownTypeState();
}

class _DropDownTypeState extends State<DropDownType> {
  String type = 'Income';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: type,
              // icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              // underline: Container(
              //   height: 1,
              //   color: Colors.grey,
              // ),
              onChanged: (String type) {
                setState(() {
                  this.type = type;
                });
              },
              items: <String>['Income', 'Expense']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18, fontFamily: 'NeutraText'),
                    // style: TextStyle(fontSize: 18),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
