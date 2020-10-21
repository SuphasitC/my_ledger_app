import 'package:flutter/material.dart';
import 'package:my_ledger_app/my_pocket_class.dart';
import 'package:my_ledger_app/config/routes.dart';

class Interface extends StatefulWidget {
  final Pocket pocket;
  Interface({Key key, this.pocket}) : super(key: key);

  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  Pocket pocket;

  @override
  void initState() {
    super.initState();
    pocket = widget.pocket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Pocket: ' + widget.pocket.name.toString()),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Pocket Balance',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 400.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      this.pocket.currentMoney.toString() + " Baht",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              offset: Offset(-1.5, -1.5), color: Colors.black),
                          Shadow(
                              offset: Offset(1.5, -1.5), color: Colors.black),
                          Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                          Shadow(
                              offset: Offset(-1.5, 1.5), color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Container(
                width: 400,
                height: 270,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 2,
                  // ),
                  // borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.grey[700],
                ),
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    shadows: [
                      Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
                      Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
                      Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                      Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () => {
                    // Navigator.of(context).pop(),
                    Navigator.of(context)
                        .pushNamed(AppRoutes.incomeExpense, arguments: pocket)
                        .then((value) => this.setState(() {}))
                  },
                  textColor: Colors.black,
                  child: Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      'Income\nExpense',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  padding: EdgeInsets.all(0.0),
                ),
                RaisedButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.utc(1998, DateTime.november, 12),
                        lastDate: DateTime.utc(2030, DateTime.november, 12));
                  },
                  textColor: Colors.black,
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple[400],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    // padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Calendar',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // RaisedButton(
                //   onPressed: () => {},
                //   textColor: Colors.black,
                //   child: Container(
                //     width: 150,
                //     height: 50,
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //       color: Colors.redAccent,
                //       borderRadius: BorderRadius.all(Radius.circular(8)),
                //     ),
                //     // padding: EdgeInsets.all(10.0),
                //     child: Text(
                //       'Expense',
                //       style: TextStyle(fontSize: 25),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
