import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  var userStatus = 'Online';

  void setStatus(status) {
    userStatus = status;
  }

  final bottomDrawerKey = GlobalKey();

  Icon returnStatusIcon(status) {
    if (status == 'Online') {
      return Icon(
        Icons.brightness_1,
        color: Colors.green,
        size: 12,
      );
    } else if (status == 'Idle') {
      return Icon(
        Icons.brightness_3,
        color: Colors.yellow,
        size: 12,
      );
    } else if (status == 'Do Not Disturb') {
      return Icon(
        Icons.remove_circle,
        color: Colors.red,
        size: 12,
      );
    } else if (status == 'Invisible') {
      return Icon(
        Icons.adjust,
        color: Colors.grey,
        size: 12,
      );
    }
    notifyListeners();
  }
}
