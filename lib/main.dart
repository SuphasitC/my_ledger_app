import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ledger_app/pocket_observer.dart';
import 'package:my_ledger_app/presentation/add_pocket.dart';
import 'package:my_ledger_app/presentation/edit_list_tile.dart';
import 'package:my_ledger_app/presentation/first_page.dart';
import 'package:my_ledger_app/presentation/interface.dart';
import 'package:my_ledger_app/presentation/my_pocket.dart';
import 'package:my_ledger_app/my_pocket_class.dart';
import 'package:my_ledger_app/config/routes.dart';
import 'package:my_ledger_app/presentation/note_optional.dart';

import 'presentation/income_expense.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = PocketListObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PocketListCubit(),
      child: MaterialApp(
        title: 'Ledger App',
        theme: ThemeData(
          fontFamily: 'NeutraText',
          // fontFamily: 'THSarabunNew',
          // fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _registerRouteWithParameters,

        // home: MyPocket(),
        home: FirstPage(),
      ),
    );
  }
}

Route _registerRouteWithParameters(RouteSettings settings) {
  Pocket pocket = settings.arguments;
  if (settings.name == AppRoutes.myPocket) {
    return MaterialPageRoute(builder: (context) {
      return MyPocket();
    });
  }
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
  if (settings.name == AppRoutes.incomeExpense) {
    return MaterialPageRoute(builder: (context) {
      return Income(
        pocket: pocket,
      );
    });
  }
  if (settings.name == AppRoutes.editListTile) {
    return MaterialPageRoute(builder: (context) {
      return EditListTile(pocket: pocket);
    });
  }
  if (settings.name == AppRoutes.noteList) {
    return MaterialPageRoute(builder: (context) {
      return NoteList();
    });
  }
  return null;
}
