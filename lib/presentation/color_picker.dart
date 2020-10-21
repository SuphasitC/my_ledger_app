import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../my_pocket_class.dart';

class MyColorPicker extends StatefulWidget {
  Color pocketColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  Color pocketColor;
  Color currentColor;

  @override
  void initState() {
    super.initState();
    pocketColor = widget.pocketColor;
    currentColor = widget.currentColor;
  }

  void changeColor(Color color) {
    setState(() => pocketColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        setState(() => currentColor = pocketColor);
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
              //           pickerColor: currentColor,
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
    );
  }
}
