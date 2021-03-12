import 'dart:convert';

import 'package:http/http.dart' as http;

class WuiHttpException {

  final String? message;
  final String? code;
  final int? status;
  final Map<String, dynamic>? data;

  WuiHttpException({
    this.message,
    this.code,
    this.status,
    this.data
  });

  toString() {
    return this.message!;
  }

}

class WuiHttpService {

  static final WuiHttpService _instance = WuiHttpService._internal();
  factory WuiHttpService() {
    return _instance;
  }
  WuiHttpService._internal();

  get(String url, [Map<String, dynamic> options = const {}]) async {
    http.Response res = await http.get(Uri.parse(url), headers: options['headers']);
    if(res.statusCode >= 400) {
      Map<String, dynamic> jsonError = json.decode(res.body);
      throw WuiHttpException(
        code: jsonError['code'] ?? '',
        message: jsonError['msg'] ?? '',
        data: jsonError['data'] ?? {},
        status: res.statusCode
      );
    }
    return json.decode(res.body);
  }

  post(url, Map<String, dynamic>? data, [Map<String, dynamic> options = const {}]) async {
    http.Response res = await http.post(Uri.parse(url), body: json.encode(data), headers: options['headers']);
    if(res.statusCode >= 400) {
      Map<String, dynamic> jsonError = json.decode(res.body);
      throw WuiHttpException(
        code: jsonError['code'] ?? '',
        message: jsonError['msg'] ?? '',
        data: jsonError['data'] ?? {},
        status: res.statusCode
      );
    }
    return json.decode(res.body);
  }

  patch(url, Map<String, dynamic> data, [Map<String, dynamic> options = const {}]) async {
    http.Response res = await http.patch(Uri.parse(url), body: json.encode(data), headers: options['headers']);
    print(res.statusCode);
    if(res.statusCode >= 400) {
      Map<String, dynamic> jsonError = json.decode(res.body);
      throw WuiHttpException(
        code: jsonError['code'] ?? '',
        message: jsonError['msg'] ?? '',
        data: jsonError['data'] ?? {},
        status: res.statusCode
      );
    }
    if(res.body.length > 0) {
      return json.decode(res.body);
    }
    return;
  }

  delete(url, [Map<String, dynamic> options = const {}]) async {
    http.Response res = await http.delete(Uri.parse(url), headers: options['headers']);
    if(res.statusCode >= 400) {
      Map<String, dynamic> jsonError = json.decode(res.body);
      throw WuiHttpException(
        code: jsonError['code'] ?? '',
        message: jsonError['msg'] ?? '',
        data: jsonError['data'] ?? {},
        status: res.statusCode
      );
    }
    if(res.body.length > 0) {
      return json.decode(res.body);
    }
    return;
  }

}