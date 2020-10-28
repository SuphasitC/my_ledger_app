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
        title: Text('Pocket: ' + pocket.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Pocket Balance',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 400.0,
                    height: 100.0,
                    decoration: BoxDecoration(
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
            pocket.note.isEmpty
                ? Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: 400,
                      height: 240,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellowAccent,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.black,
                      ),
                      child: Text(
                        "There's no transaction now.",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 365,
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.yellowAccent,
                            width: 2,
                          ),
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: pocket.note.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Card(
                                    color: Colors.black,
                                    child: ListTile(
                                      title: Text(
                                        pocket.note[index].detail,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                offset: Offset(-1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, 1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(-1.5, 1.5),
                                                color: Colors.black),
                                          ],
                                        ),
                                      ),
                                      trailing: Text(
                                        pocket.note[index].isIncome
                                            ? "+ " +
                                                pocket.note[index].value
                                                    .toString()
                                            : "- " +
                                                pocket.note[index].value
                                                    .toString(),
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: pocket.note[index].isIncome
                                              ? Colors.green
                                              : Colors.red,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                offset: Offset(-1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, 1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(-1.5, 1.5),
                                                color: Colors.black),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.incomeExpense, arguments: pocket)
                          .then((value) => this.setState(() {}))
                    },
                    textColor: Colors.black,
                    child: Container(
                      width: 150,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
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
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.purple[400],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text(
                        'Calendar',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
