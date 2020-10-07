import 'package:flutter/material.dart';

class DropDownCurrency extends StatefulWidget {
  @override
  _DropDownCurrencyState createState() => _DropDownCurrencyState();
}

class _DropDownCurrencyState extends State<DropDownCurrency> {
  String currency = 'Baht';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 59, bottom: 10),
          child: Text(
            "Currency",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 60,
          width: 350,
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: DropdownButton<String>(
            isExpanded: true,
            value: currency,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newCurrency) {
              setState(() {
                currency = newCurrency;
              });
            },
            items: <String>['Baht', 'Dollar', 'Yen', 'GBP']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 18),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
