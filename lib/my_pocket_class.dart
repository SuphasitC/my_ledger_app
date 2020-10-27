import 'package:flutter/material.dart';
import 'note_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pocket {
  String name;
  double currentMoney;
  bool isFavourited = false;
  Color color;
  List<Note> note;
  String pocketID;
  Pocket(this.name, this.currentMoney, this.isFavourited, this.color, this.note,
      this.pocketID);
}

List<Pocket> pockets = [];
List<Pocket> favouritePockets = [];
bool startApp = true;

bool isNotEmpty(List<Pocket> poc) {
  if (poc.length == 0)
    return false;
  else
    return true;
}

String generatePocketID() {
  String generatedID = UniqueKey().toString();
  return generatedID;
}

final databaseReference = Firestore.instance;

void getPockets() {
  Pocket pck;
  print("getPockets is worked!");
  print("startApp = " + startApp.toString());
  startApp = !startApp;

  databaseReference
      .collection("pockets")
      .getDocuments()
      .then((QuerySnapshot pocketSnapshot) {
    pocketSnapshot.documents.forEach((pocket) => {
          pck = Pocket(
            pocket.data["name"],
            double.parse(pocket.data["currentMoney"].toString()),
            pocket.data["isFavourited"],
            Color(int.parse("0x${pocket.data["color"]}")),
            [],
            pocket.data["id"],
          ),
          pockets.add(pck),
          if (pocket.data["isFavourited"] == true)
            {
              favouritePockets.add(pck),
            },
          databaseReference
              .collection("notes")
              .document(pocket.data["id"])
              .collection("all")
              .getDocuments()
              .then((QuerySnapshot snapshot) {
            snapshot.documents.forEach((note) => {
                  pockets[pockets.length - 1].note.add(
                        Note(note.data["detail"], note.data["value"],
                            note.data["isIncome"]),
                      )
                });
          }),
        });
  });
}
