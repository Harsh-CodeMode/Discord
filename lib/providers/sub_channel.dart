import 'package:flutter/material.dart';
import './message_box.dart';

class SubChannel extends ChangeNotifier {
  final id;
  final String parentChannelName;
  final String name;
  final bool private;
  final int unreadMessages;
  List<MessageBox> messages = [];

  SubChannel({this.name, this.private, this.unreadMessages, this.id, this.parentChannelName});

  void setMessages({List<MessageBox> messageList}) {
    messages = messageList;
    notifyListeners();
  }

}
