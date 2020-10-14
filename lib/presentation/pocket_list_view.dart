import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../my_pocket_class.dart';

class PocketListTile extends StatefulWidget {
  final int index;
  PocketListTile({Key key, this.index}) : super(key: key);
  @override
  _PocketListTileState createState() => _PocketListTileState();
}

class _PocketListTileState extends State<PocketListTile> {
  int index;
  @override
  void initState() {
    super.initState();
    index = widget.index;
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
            color: Color(0xFFE9765B),
          ),
          alignment: Alignment.center,
          width: 400,
          height: 80,
          // color: Colors.red[400],
          child: ListTile(
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
            },
          )),
    );
  }
}
