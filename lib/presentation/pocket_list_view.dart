import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../my_pocket_class.dart';

class PocketListTile extends StatefulWidget {
  final int index;
  final Function refreshState;
  final Color pocketColor;
  final bool myFav;
  PocketListTile(
      {Key key, this.index, this.refreshState, this.pocketColor, this.myFav})
      : super(key: key);
  @override
  _PocketListTileState createState() => _PocketListTileState();
}

class _PocketListTileState extends State<PocketListTile> {
  int index;
  Function refreshState;
  Color pocketColor;
  bool myFav;
  @override
  void initState() {
    super.initState();
    index = widget.index;
    refreshState = widget.refreshState;
    pocketColor = widget.pocketColor;
    myFav = widget.myFav;
  }

  @override
  Widget build(BuildContext context) {
    return myFav
        ? Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red[500],
                  width: 3,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: favouritePockets[0].color,
              ),
              width: 400,
              height: 120,
              child: Stack(
                children: [
                  ListTile(
                    title: Text(
                      favouritePockets[0].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
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
                      favouritePockets[0].currentMoney.toString(),
                      textScaleFactor: 1.25,
                      style: TextStyle(
                        fontSize: 40.0,
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
                      Navigator.of(context)
                          .pushNamed(AppRoutes.interface,
                              arguments: favouritePockets[0])
                          .then((value) => this.setState(() {
                                this.refreshState();
                              })),
                    },
                  ),
                  Container(
                    width: 223,
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () => {
                        favouritePockets.removeAt(0),
                        this.refreshState(),
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 15),
                        child: Row(
                          children: <Widget>[
                            // Padding(
                            //   padding: EdgeInsets.only(left: 3),
                            //   child: Text(
                            //     "Unpin from Favourite ",
                            //     style:
                            //         TextStyle(color: Colors.white, fontSize: 20),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                            Text(
                              "Unpin from Favourite ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red[500],
                  width: 3,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: pockets[index].color,
              ),
              width: 400,
              height: 120,
              child: Stack(
                children: [
                  ListTile(
                    title: Text(
                      pockets[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
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
                      textScaleFactor: 1.25,
                      style: TextStyle(
                        fontSize: 40.0,
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
                      Navigator.of(context)
                          .pushNamed(AppRoutes.interface,
                              arguments: pockets[index])
                          .then((value) => this.setState(() {}))
                    },
                  ),
                  Container(
                    width: 200,
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () => {
                        // print("pocketColor = " + pocketColor.toString()),
                        if (!favouritePockets.contains(pockets[index]))
                          {
                            if (favouritePockets.length == 0)
                              {
                                pockets[index].isFavourited = true,
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
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Pin to Favourite ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
                  ),
                  Positioned(
                    right: 50,
                    bottom: 15,
                    child: GestureDetector(
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onTap: () => {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.editListTile)
                            .then((value) => this.setState(() {})),
                      },
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 15,
                    child: GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onTap: () => {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Deleting pocket",
                                style: TextStyle(fontSize: 25),
                              ),
                              content: Text(
                                "Are you sure to remove this pocket?",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Yes"),
                                  onPressed: () => {
                                    pockets.removeAt(index),
                                    this.refreshState(),
                                    Navigator.of(context).pop()
                                  },
                                ),
                                FlatButton(
                                  child: Text("No"),
                                  onPressed: () =>
                                      {Navigator.of(context).pop()},
                                ),
                              ],
                            );
                          },
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
