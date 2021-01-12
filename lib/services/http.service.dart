import 'dart:convert';

import 'package:http/http.dart' as http;

class WuiHttpException {

  final String message;
  final String code;
  final int status;

  WuiHttpException({
    this.message,
    this.code,
    this.status
  });

}

class WuiHttpService {

  static final WuiHttpService _instance = WuiHttpService._internal();
  factory WuiHttpService() {
    return _instance;
  }
  WuiHttpService._internal();

  get(url, [Map<String, dynamic> options = const {}]) async {
    return await http.get(url, headers: options != null ? options['headers'] : null);
  }

  post(url, Map<String, dynamic> data, [Map<String, dynamic> options = const {}]) async {
    return await http.post(url, body: json.encode(data), headers: options['headers']);
  }

  patch(url, Map<String, dynamic> data, [Map<String, dynamic> options = const {}]) async {
    return await http.patch(url, body: json.encode(data), headers: options['headers']);
  }

  delete(url, [Map<String, dynamic> options = const {}]) async {
    return await http.delete(url, headers: options['headers']);
  }

}