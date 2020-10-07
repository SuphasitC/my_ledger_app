import 'package:flutter/material.dart';
import 'package:my_ledger_app/my_pocket_class.dart';
import 'package:my_ledger_app/presentation/drop_down_currencies.dart';
import 'package:my_ledger_app/presentation/input_form.dart';
import 'package:my_ledger_app/global_storage.dart';

class AddPocketPage extends StatelessWidget {
  Pocket createPocket() {
    String name = '';
    double initialMoney = 0;
    double currentMoney = initialMoney;
    if (store.get("pocketName") != null) {
      name = store.get("pocketName");
    }
    if (store.get("initialMoney") != null) {
      initialMoney = double.parse(store.get("initialMoney"));
      currentMoney = initialMoney;
    }
    return Pocket(name, initialMoney, currentMoney);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Pocket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            NameForm(),
            InitialMoneyForm(),
            DropDownCurrency(),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: RaisedButton(
                onPressed: () {
                  pockets.add(createPocket());
                  Navigator.of(context).pop();
                },
                textColor: Colors.black,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Create Pocket',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
