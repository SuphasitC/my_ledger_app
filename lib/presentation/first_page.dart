import 'package:flutter/material.dart';
import 'package:my_ledger_app/config/routes.dart';
import 'package:my_ledger_app/my_pocket_class.dart';

import '../my_pocket_class.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    getPockets();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(milliseconds: 3500),
        () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed(AppRoutes.myPocket),
            });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 50),
            child: Image(image: AssetImage('img_assets/logo.png')),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "My Ledger App",
              style: TextStyle(color: Colors.lightGreen, fontSize: 40),
            ),
          ),
        ],
      )),
    );
  }
}
