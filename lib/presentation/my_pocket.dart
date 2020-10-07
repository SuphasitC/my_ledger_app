import 'package:flutter/material.dart';
import 'package:my_ledger_app/config/routes.dart';
import 'package:my_ledger_app/my_pocket_class.dart';

class MyPocket extends StatefulWidget {
  MyPocket({Key key}) : super(key: key);

  @override
  _MyPocketState createState() => _MyPocketState();
}

class _MyPocketState extends State<MyPocket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pocket'),
      ),
      body: isNotEmpty(pockets)
          ? ListView.builder(
              itemCount: pockets.length,
              itemBuilder: (context, index) => Card(
                  color: Colors.orange[300],
                  child: ListTile(
                    title: Text(
                      pockets[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
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
                    trailing: Text(
                      pockets[index].currentMoney.toString(),
                      textScaleFactor: 2.0,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
                    onTap: () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushNamed(AppRoutes.interface,
                          arguments: pockets[index])
                    },
                  )),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You don't have any pocket yet.",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Please create a new one.",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context)
              .pushNamed(AppRoutes.addPocket)
              .then((value) => this.setState(() {})),
        },
        tooltip: 'Add Pocket',
        child: Icon(Icons.add),
      ),
    );
  }
}
