import 'package:flutter/material.dart';
import './message_box.dart';

class SubChannel extends ChangeNotifier {
  final String name;
  final bool private;
  final int unreadMessages;
  List<MessageBox> messages;

  SubChannel({this.name, this.private, this.unreadMessages, this.messages});
}
