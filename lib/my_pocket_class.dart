import 'package:flutter/material.dart';

class Pocket {
  final String name;
  double currentMoney;
  bool isFavourited = false;
  Color color;
  Pocket(this.name, this.currentMoney, this.isFavourited, this.color);
}

List<Pocket> pockets = [];
List<Pocket> favouritePockets = [];

bool isNotEmpty(List<Pocket> poc) {
  if (poc.length == 0)
    return false;
  else
    return true;
}
