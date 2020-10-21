import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../my_pocket_class.dart';

class PocketListTile extends StatefulWidget {
  final int index;
  final Function refreshState;
  final Color pocketColor;
  PocketListTile({Key key, this.index, this.refreshState, this.pocketColor})
      : super(key: key);
  @override
  _PocketListTileState createState() => _PocketListTileState();
}

class _PocketListTileState extends State<PocketListTile> {
  int index;
  Function refreshState;
  Color pocketColor;
  @override
  void initState() {
    super.initState();
    index = widget.index;
    refreshState = widget.refreshState;
    pocketColor = widget.pocketColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red[500],
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // color: Color(0xFFE9765B),
            color: pockets[index].color,
          ),
          // alignment: Alignment.center,
          width: 400,
          height: 120,
          // color: Colors.red[400],
          child: Stack(
            // alignment: Alignment.center,
            children: [
              ListTile(
                title: Text(
                  pockets[index].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    shadows: [
                      Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
                      Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
                      Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                      Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
                    ],
                  ),
                ),
                trailing: Text(
                  pockets[index].currentMoney.toString(),
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
                      Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
                      Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                      Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
                    ],
                  ),
                ),
                onTap: () => {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.interface, arguments: pockets[index])
                      .then((value) => this.setState(() {}))
                },
              ),
              Container(
                width: 200,
                alignment: Alignment.bottomLeft,
                child: RaisedButton(
                  color: pocketColor,
                  onPressed: () => {
                    // print("pocketColor = " + pocketColor.toString()),
                    if (!favouritePockets.contains(pockets[index]))
                      {
                        if (favouritePockets.length == 0)
                          {
                            favouritePockets.add(pockets[index]),
                            refreshState(),
                          }
                        else
                          {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Cannot pin to Favourite",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  content: Text(
                                    "Favourite pocket can have only one pocket!",
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () =>
                                          {Navigator.of(context).pop()},
                                    ),
                                  ],
                                );
                              },
                            )
                          }
                      }
                    else
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Cannot pin to Favourite",
                                style: TextStyle(fontSize: 25),
                              ),
                              content: Text(
                                "This pocket is already in Favourite list!",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("OK"),
                                  onPressed: () =>
                                      {Navigator.of(context).pop()},
                                ),
                              ],
                            );
                          },
                        )
                      }
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Pin to Favourite ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
