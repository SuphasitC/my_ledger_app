import 'package:flutter/material.dart';
import 'package:my_ledger_app/config/routes.dart';
import 'package:my_ledger_app/my_pocket_class.dart';
import 'package:my_ledger_app/presentation/pocket_list_view.dart';

import '../my_pocket_class.dart';

class MyPocket extends StatefulWidget {
  MyPocket({Key key}) : super(key: key);

  @override
  _MyPocketState createState() => _MyPocketState();
}

class _MyPocketState extends State<MyPocket> {
  refresh() => {this.setState(() {})};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('My Pocket'),
      ),
      body:

          // isNotEmpty(pockets)
          //     ? ListView.builder(
          //         itemCount: pockets.length,
          //         itemBuilder: (context, index) => Card(
          //             color: Colors.orange[300],
          //             child: ListTile(
          //               title: Text(
          //                 pockets[index].name,
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 30.0,
          //                   shadows: [
          //                     Shadow(
          //                         offset: Offset(-1.5, -1.5), color: Colors.black),
          //                     Shadow(
          //                         offset: Offset(1.5, -1.5), color: Colors.black),
          //                     Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
          //                     Shadow(
          //                         offset: Offset(-1.5, 1.5), color: Colors.black),
          //                   ],
          //                 ),
          //               ),
          //               trailing: Text(
          //                 pockets[index].currentMoney.toString(),
          //                 textScaleFactor: 2.0,
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   shadows: [
          //                     Shadow(
          //                         offset: Offset(-1.5, -1.5), color: Colors.black),
          //                     Shadow(
          //                         offset: Offset(1.5, -1.5), color: Colors.black),
          //                     Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
          //                     Shadow(
          //                         offset: Offset(-1.5, 1.5), color: Colors.black),
          //                   ],
          //                 ),
          //               ),
          //               onTap: () => {
          //                 // Navigator.of(context).pop(),
          //                 Navigator.of(context).pushNamed(AppRoutes.interface,
          //                     arguments: pockets[index])
          //               },
          //             )),
          //       )
          // : Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Text(
          //           "You don't have any pocket yet.",
          //           style:
          //               TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          //         ),
          //         Text("Please create a new one.",
          //             style: TextStyle(
          //                 fontSize: 22.0, fontWeight: FontWeight.bold)),
          //       ],
          //     ),
          //   ),
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Favourite ",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            isNotEmpty(favouritePockets)
                ? PocketListTile(
                    index: 0,
                    refreshState: refresh,
                    pocketColor: favouritePockets[0].color,
                  )

                // Expanded(
                //     child: ListView.builder(
                //         itemCount: favouritePockets.length,
                //         itemBuilder: (context, index) => PocketListTile(
                //               index: index,
                //               refreshState: refresh,
                //             )),
                //   )

                // : Padding(
                //     padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           width: 3,
                //           color: Colors.red[500],
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //         // color: Colors.red[400],
                //       ),
                //       alignment: Alignment.center,
                //       width: 400,
                //       height: 80,
                //       child: RawMaterialButton(
                //         onPressed: () => {},
                //         elevation: 2.0,
                //         fillColor: Colors.white,
                //         child: Icon(
                //           Icons.add,
                //           size: 35.0,
                //         ),
                //         padding: EdgeInsets.all(15.0),
                //         shape: CircleBorder(),
                //       ),
                //     ),
                //   ),
                : Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red[500],
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // color: Color(0xFFE9765B),
                      ),
                      width: 400,
                      height: 120,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All " + '(' + pockets.length.toString() + ')',
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            isNotEmpty(pockets)
                ? Expanded(
                    child: ListView.builder(
                        itemCount: pockets.length,
                        itemBuilder: (context, index) => PocketListTile(
                              index: index,
                              refreshState: refresh,
                              pocketColor: pockets[index].color,
                            )),
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
                        // color: Color(0xFFE9765B),
                      ),
                      width: 400,
                      height: 120,
                    ),
                  ),
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
