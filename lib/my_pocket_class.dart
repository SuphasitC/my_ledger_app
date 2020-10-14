class Pocket {
  final String name;
  double currentMoney;
  bool isFavourited = false;
  Pocket(this.name, this.currentMoney, this.isFavourited);
}

List<Pocket> pockets = [];
List<Pocket> favouritePockets = [];

bool isNotEmpty(List<Pocket> poc) {
  if (poc.length == 0)
    return false;
  else
    return true;
}
