class WuiConfigService {

  static WuiConfigService _instance = WuiConfigService._internal();
  WuiConfigService._internal();
  factory WuiConfigService() {
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