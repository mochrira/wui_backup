import 'dart:async';

class WuiStreamMessage {

  final String name;
  final dynamic value;
  WuiStreamMessage({
    this.name,
    this.value
  });

}

class WuiMessageService {

  static WuiMessageService  _instance = WuiMessageService._internal();
  WuiMessageService._internal();
  factory WuiMessageService() {
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