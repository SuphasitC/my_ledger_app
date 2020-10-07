class GlobalState {
  final Map<String, String> _data = <String, String>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(String key, String value) => _data[key] = value;
  get(String key) => _data[key];
}

final GlobalState store = GlobalState.instance;
