import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../my_pocket_class.dart';

class EditListTile extends StatefulWidget {
  final Pocket pocket;
  EditListTile({Key key, this.pocket}) : super(key: key);
  @override
  _EditListTileState createState() => _EditListTileState();
}

class _EditListTileState extends State<EditListTile> {
  final nameEditFormController = TextEditingController();
  Pocket pocket;
  String name = '';
  Color pocketColor;
  bool validate;
  int editingIdx;
  String colorString;

  @override
  void initState() {
    super.initState();
    pocket = this.widget.pocket;
    name = this.pocket.name;
    nameEditFormController.text = name;
    pocketColor = this.pocket.color;
    validate = false;
    editingIdx = pockets.indexWhere((element) =>
        element.name == pocket.name &&
        element.currentMoney == pocket.currentMoney);
  }

  void changeColor(Color color) {
    this.setState(() {
      pocketColor = color;
    });
  }

  void editPocketName() {
    String pocketEditedName = nameEditFormController.text;
    this.setState(() {
      name = pocketEditedName;
    });
  }

  @override
  void dispose() {
    nameEditFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              //Name
              width: 350,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, bottom: 16),
                    child: Text(
                      "New Pocket Name",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    maxLength: 12,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    controller: nameEditFormController,
                    onChanged: (text) => {
                      editPocketName(),
                      this.setState(() {
                        validate = false;
                      }),
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Enter Pocket Name',
                      errorText:
                          validate == true ? 'Name must not be empty.' : null,
                      errorStyle: TextStyle(fontSize: 18),
                      helperStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
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
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            color: pocketColor,
                          ),
                          child: RaisedButton(
                            color: pocketColor,
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
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: RaisedButton(
                            onPressed: () => {
                              this.setState(() {
                                nameEditFormController.text.isEmpty
                                    ? validate = true
                                    : validate = false;
                              }),
                              pocket.name = nameEditFormController.text,
                              pocket.color = pocketColor,
                              pockets[editingIdx] = pocket,
                              if (!validate)
                                {
                                  colorString = pocketColor.toString(),
                                  colorString = colorString.substring(
                                      colorString.indexOf('x') + 1,
                                      colorString.length - 2),
                                  databaseReference
                                      .collection("pockets")
                                      .document(pockets[editingIdx].pocketID)
                                      .updateData({
                                    "name": nameEditFormController.text,
                                    "color": colorString
                                  }),
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
                              child: const Text('Finish',
                                  style: TextStyle(fontSize: 30)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
