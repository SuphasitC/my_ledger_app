import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../my_pocket_class.dart';

class MoneyForm extends StatefulWidget {
  @override
  _MoneyFormState createState() => _MoneyFormState();
}

class _MoneyFormState extends State<MoneyForm> {
  final nameFormController = TextEditingController();
  final moneyFormController = TextEditingController();
  String name = '';
  double currentMoney = 0;

  bool validateName = false;
  bool validateMoney = false;

  Pocket createPocket(bool isFavourited) {
    return Pocket(name, currentMoney, isFavourited);
  }

  void setPocketMoney() {
    String currentMoneyString = moneyFormController.text;
    var cur = double.tryParse(currentMoneyString);
    this.setState(() {
      cur != null ? currentMoney = cur : currentMoney = 0;
    });
  }

  void setPocketName() {
    String pocketName = nameFormController.text;
    this.setState(() {
      name = pocketName;
    });
  }

  @override
  void dispose() {
    nameFormController.dispose();
    moneyFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //Name
          width: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 16),
                child: Text(
                  "Pocket Name",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                maxLength: 12,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                controller: nameFormController,
                onChanged: (text) => {
                  setPocketName(),
                  this.setState(() {
                    validateName = false;
                  }),
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  // icon: Icon(Icons.credit_card),
                  fillColor: Colors.white,
                  hintText: 'Enter Pocket Name',
                  errorText:
                      validateName == true ? 'Name must not be empty.' : null,
                  errorStyle: TextStyle(fontSize: 18),
                  helperStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          //Money
          width: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 16),
                child: Text(
                  "Initial Money",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                controller: moneyFormController,
                onChanged: (text) => {
                  setPocketMoney(),
                  this.setState(() {
                    validateMoney = false;
                  }),
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  // icon: Icon(Icons.credit_card),
                  fillColor: Colors.white,
                  hintText: 'Enter Initial Money',
                  errorText: validateMoney == true
                      ? 'Initial money must not be empty or NaN'
                      : null,
                  errorStyle: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: RaisedButton(
                  onPressed: () => {
                    this.setState(() {
                      moneyFormController.text.isEmpty ||
                              (double.tryParse(moneyFormController.text) ==
                                  null)
                          ? validateMoney = true
                          : validateMoney = false;
                      nameFormController.text.isEmpty
                          ? validateName = true
                          : validateName = false;
                    }),
                    if (!validateName && !validateMoney)
                      {
                        pockets.add(createPocket(false)),
                        Navigator.of(context).pop(),
                      }
                  },
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Create Pocket',
                        style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
