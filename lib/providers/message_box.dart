import 'package:flutter/material.dart';

import './friends.dart';

class MessageBox extends ChangeNotifier {
  List<String> messageList = ['skldfjskj', 'sldkfjsdljf', 'dskfjdkjdfj'];

  void addMessage(String message) {
    messageList.add(message);
    notifyListeners();
  }
}

