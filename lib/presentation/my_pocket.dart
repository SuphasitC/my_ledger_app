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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('My Pocket'),
      ),
      body: Center(
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
                    myFav: true,
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red[500],
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 400,
                      height: 120,
                      child: Text(
                        "There's no favorited pocket, add some pocket.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
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
                        myFav: false,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red[500],
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 400,
                      height: 120,
                      child: Text(
                        "Add some pocket.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
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
