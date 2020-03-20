import 'package:flutter/material.dart';

import './friends.dart';

class MessageBox extends ChangeNotifier {
  final String time;
  final String date;
  List<String> messageList;
  MessageBox({this.messageList, this.time, this.date});

  void addMessage(String message) {
    messageList.add(message);
    notifyListeners();
  }
}

