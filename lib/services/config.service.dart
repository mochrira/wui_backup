class ConfigService {

  static ConfigService _instance = ConfigService._internal();
  ConfigService._internal();
  factory ConfigService() {
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