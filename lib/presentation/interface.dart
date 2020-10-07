import 'package:flutter/material.dart';
import 'package:my_ledger_app/my_pocket_class.dart';

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
      appBar: AppBar(
        title: Text(widget.pocket.currentMoney.toString()),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Stack(
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 180.0,
                        height: 180.0,
                        decoration: new BoxDecoration(
                          color: Colors.orange[400],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          this.pocket.currentMoney.toString() + " Baht",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.black,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.lightGreen,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Income',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.black,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Expense',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: RaisedButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.utc(1998, DateTime.november, 12),
                      lastDate: DateTime.utc(2030, DateTime.november, 12));
                },
                textColor: Colors.black,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: 336,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'Calendar',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
