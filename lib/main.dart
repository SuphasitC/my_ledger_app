import 'package:flutter/material.dart';
import 'package:my_ledger_app/presentation/add_pocket.dart';
import 'package:my_ledger_app/presentation/interface.dart';
import 'package:my_ledger_app/presentation/my_pocket.dart';
import 'package:my_ledger_app/my_pocket_class.dart';
import 'package:my_ledger_app/config/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NeutraText',
        // fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _registerRouteWithParameters,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyPocket(),
      // home: AddPocketPage(),
      // home: Interface(
      //   pocketName: 'Em',
      // ),
    );
  }
}

Route _registerRouteWithParameters(RouteSettings settings) {
  Pocket pocket = settings.arguments;
  if (settings.name == AppRoutes.addPocket) {
    return MaterialPageRoute(builder: (context) {
      return AddPocketPage();
    });
  }
  if (settings.name == AppRoutes.interface) {
    return MaterialPageRoute(builder: (context) {
      return Interface(pocket: pocket);
    });
  }
  return null;
}
