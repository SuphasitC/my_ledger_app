import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_ledger_app/presentation/color_picker.dart';
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

  Color pocketColor = Color(0xFFE9765B);

  Pocket createPocket(Color pckColor) {
    return Pocket(name, currentMoney, false, pckColor);
  }

  void changeColor(Color color) {
    this.setState(() {
      pocketColor = color;
    });
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
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              TextFormField(
                maxLength: 12,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
                controller: nameFormController,
                onChanged: (text) => {
                  setPocketName(),
                  this.setState(() {
                    validateName = false;
                  }),
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    // borderRadius: BorderRadius.circular(25.7),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  // icon: Icon(Icons.credit_card),
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey),
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
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
                controller: moneyFormController,
                onChanged: (text) => {
                  setPocketMoney(),
                  this.setState(() {
                    validateMoney = false;
                  }),
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    // borderRadius: BorderRadius.circular(25.7),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  // icon: Icon(Icons.credit_card),
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter Initial Money',
                  errorText: validateMoney == true
                      ? 'Initial money must not be empty or NaN'
                      : null,
                  errorStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        /*-----------------------------------------------Color Picker-----------------------------------------------*/
        Container(
          //color
          width: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 16),
                child: Text(
                  "Pocket Color",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              RaisedButton(
                elevation: 3.0,
                onPressed: () => {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: pocketColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Select'),
                          onPressed: () {
                            setState(() => {});
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Text('Select a color'),
                  //       content: SingleChildScrollView(
                  //         child: BlockPicker(
                  //           pickerColor: pocketColor,
                  //           onColorChanged: changeColor,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                },
              )
            ],
          ),
        ),
        /*-------------------------------------------------------------------------------------------------------------*/
        //button
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: RaisedButton(
            onPressed: () => {
              this.setState(() {
                moneyFormController.text.isEmpty ||
                        (double.tryParse(moneyFormController.text) == null)
                    ? validateMoney = true
                    : validateMoney = false;
                nameFormController.text.isEmpty
                    ? validateName = true
                    : validateName = false;
              }),
              if (!validateName && !validateMoney)
                {
                  pockets.add(createPocket(pocketColor)),
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
              child:
                  const Text('Create Pocket', style: TextStyle(fontSize: 30)),
            ),
          ),
        ),
      ],
    );
  }
}
