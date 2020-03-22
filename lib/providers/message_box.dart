import 'package:flutter/material.dart';

import './friends.dart';

class MessageBox extends ChangeNotifier {
  bool loading;
  final String time;
  final String date;
  List<String> messageList;
  MessageBox({this.messageList, this.time, this.date, this.loading});

  void addMessage(String message) {
    messageList.add(message);
    notifyListeners();
  }
  void setLoading(loadingValue){
    loading = loadingValue;
    notifyListeners();
  }
}

