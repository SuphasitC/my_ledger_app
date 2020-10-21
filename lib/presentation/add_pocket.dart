import 'package:flutter/material.dart';
import 'package:my_ledger_app/presentation/input_form.dart';

import 'input_form.dart';

class AddPocketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Add Pocket'),
      ),
      body: Center(child: MoneyForm()),
    );
  }
}
