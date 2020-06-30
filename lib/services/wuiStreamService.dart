import 'dart:async';

class WuiStreamMessage {

  final String name;
  final dynamic value;
  WuiStreamMessage({
    this.name,
    this.value
  });

}

class WuiStreamService {

  static WuiStreamService  _instance = WuiStreamService._internal();
  WuiStreamService._internal();
  factory WuiStreamService() {
    return _instance;
  }

  StreamController<WuiStreamMessage> _streamController = StreamController.broadcast();
  Stream<WuiStreamMessage> stream(List<String> streamNames) {
    return _streamController.stream.where((msg) => streamNames.contains(msg.name));
  }

  void broadcast(String name, dynamic value) {
    _streamController.add(WuiStreamMessage(
      name: name,
      value: value
    ));
  }

}