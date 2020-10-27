import 'package:flutter/material.dart';
import 'package:my_ledger_app/config/routes.dart';
import 'package:my_ledger_app/my_pocket_class.dart';
import '../my_pocket_class.dart';
import '../note_list.dart';

class Income extends StatefulWidget {
  final Pocket pocket;
  Income({Key key, this.pocket}) : super(key: key);

  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final moneyFormController = TextEditingController();
  final myNoteController = TextEditingController();
  double moneyValue;
  bool validate;
  String type;
  Pocket pocket;
  Note note;

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
    myNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                      padding: EdgeInsets.only(top: 35, bottom: 10),
                      child: Text(
                        "Value*",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    controller: moneyFormController,
                    onChanged: (text) => {},
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Money Value',
                      errorText: validate == true
                          ? 'Money must not be empty, NaN or minus'
                          : null,
                      errorStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 10),
                      child: Text(
                        "Income or Expense*",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  //Dropdown
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.black54,
                        isExpanded: true,
                        value: type,
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
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
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 10),
                      child: Text(
                        "Note",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 250,
                        child: TextFormField(
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                          controller: myNoteController,
                          onChanged: (text) => {},
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.note,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Write your note (Optional)',
                            errorText: null,
                            errorStyle: TextStyle(fontSize: 18),
                            helperStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Text(
                        "or",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => {
                          Navigator.of(context)
                              .pushNamed(
                                AppRoutes.noteList,
                              )
                              .then((value) => this.setState(() {
                                    if (value != null) {
                                      myNoteController.text = value.toString();
                                    }
                                  })),
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
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
                      note = Note(
                        myNoteController.text.isNotEmpty
                            ? myNoteController.text
                            : type == 'Income' ? 'Income' : 'Expense',
                        moneyValue,
                        type == 'Income' ? true : false,
                      ),
                      if (pocket.currentMoney - moneyValue < 0 &&
                          type == 'Expense')
                        {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Pocket Balance Error"),
                                  content: Text(
                                    "Expense amount > Pocket Balance\n(Now Balance = " +
                                        this.pocket.currentMoney.toString() +
                                        ")",
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
                      else
                        {
                          if (type == 'Expense')
                            {
                              pocket.currentMoney -= moneyValue,
                            }
                          else
                            {
                              pocket.currentMoney += moneyValue,
                            },
                          //currentMoneyChange
                          databaseReference
                              .collection("pockets")
                              .document(pocket.pocketID)
                              .updateData({
                            "currentMoney": pocket.currentMoney,
                          }),
                          //Add note
                          databaseReference
                              .collection("notes")
                              .document(pocket.pocketID)
                              .collection("all")
                              .document()
                              .setData({
                            "detail": myNoteController.text.isNotEmpty
                                ? myNoteController.text
                                : type == 'Income' ? 'Income' : 'Expense',
                            "value": moneyValue,
                            "isIncome": type == 'Income' ? true : false,
                          }),
                          pocket.note.add(note),
                          Navigator.of(context).pop(),
                        }
                    }
                },
                textColor: Colors.black,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text('Finish', style: TextStyle(fontSize: 30)),
                ),
              ),
            ),
            Container(
              width: 350,
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
