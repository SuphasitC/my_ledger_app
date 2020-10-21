import 'package:flutter/material.dart';
import 'package:my_ledger_app/my_pocket_class.dart';
import 'package:my_ledger_app/presentation/drop_down_currencies.dart';
import '../my_pocket_class.dart';
import 'drop_down_currencies.dart';

class Income extends StatefulWidget {
  Pocket pocket;
  Income({Key key, this.pocket}) : super(key: key);

  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final moneyFormController = TextEditingController();
  final myTextController = TextEditingController();
  double moneyValue;
  bool validate;
  String type;
  Pocket pocket;
  // final dropDown = DropDownType();

  @override
  void initState() {
    super.initState();
    moneyValue = 0;
    validate = false;
    type = 'Income';
    pocket = widget.pocket;
  }

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 350,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 10),
                      child: Text(
                        "Value*",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          // color: Colors.red[400],
                        ),
                        // textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    controller: moneyFormController,
                    onChanged: (text) => {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      // icon: Icon(Icons.credit_card),
                      fillColor: Colors.white,
                      hintText: 'Money Value',
                      errorText: validate == true
                          ? 'Money must not be empty, NaN or minus'
                          : null,
                      errorStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 10),
                      child: Text(
                        "Choose Type*",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        // textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  //Dropdown
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
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'NeutraText'),
                              // style: TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 10),
                      child: Text(
                        "Note",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        // textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    controller: myTextController,
                    onChanged: (text) => {},
                    decoration: InputDecoration(
                      icon: Icon(Icons.note),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      // icon: Icon(Icons.credit_card),
                      fillColor: Colors.white,
                      hintText: 'Write your note (Optional)',
                      errorText: null,
                      // validateName == true ? 'Name must not be empty.' : null,
                      errorStyle: TextStyle(fontSize: 18),
                      helperStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: RaisedButton(
                onPressed: () => {
                  this.setState(() {
                    moneyFormController.text.isEmpty ||
                            (double.tryParse(moneyFormController.text) ==
                                    null ||
                                double.tryParse(moneyFormController.text) < 0)
                        ? validate = true
                        : validate = false;
                  }),
                  if (!validate)
                    {
                      moneyValue = double.parse(moneyFormController.text),
                      if (type == 'Expense')
                        {
                          if (pocket.currentMoney - moneyValue >= 0)
                            {
                              pocket.currentMoney -= moneyValue,
                              Navigator.of(context).pop(),
                            }
                          else
                            {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Pocket Balance Error"),
                                      content: Text(
                                        "Expense amount > Pocket Balance",
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("OK"),
                                          onPressed: () => {
                                            Navigator.of(context).pop(),
                                          },
                                        ),
                                      ],
                                    );
                                  })
                            }
                        }
                      else
                        {
                          pocket.currentMoney += moneyValue,
                          Navigator.of(context).pop(),
                        },
                    }
                },
                textColor: Colors.black,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Finish', style: TextStyle(fontSize: 30)),
                ),
              ),
            ),
            Container(
              //Money
              width: 350,
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 45, bottom: 16),
                  //   child:
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
