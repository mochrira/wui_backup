import 'dart:async';

class WuiStreamMessage {

  final String? name;
  final dynamic value;
  WuiStreamMessage({
    this.name,
    this.value
  });

}

class WuiMessage {

  static WuiMessage  _instance = WuiMessage._internal();
  WuiMessage._internal();
  factory WuiMessage() {
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