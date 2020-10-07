class Pocket {
  final String name;
  double initialMoney;
  double currentMoney;
  Pocket(this.name, this.initialMoney, this.currentMoney);
}

List<Pocket> pockets = [];
List<Pocket> favouritePockets = [];

bool isNotEmpty(List<Pocket> poc) {
  if (poc.length == 0)
    return false;
  else
    return true;
}
