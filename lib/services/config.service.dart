class WuiConfig {

  static WuiConfig _instance = WuiConfig._internal();
  WuiConfig._internal();
  factory WuiConfig() {
    return _instance;
  }

  Map<String, dynamic> _config = Map();

  addValue(String key, dynamic value) {
    _config[key] = value;
  }

  getValue(String key) {
    return _config[key];
  }

}