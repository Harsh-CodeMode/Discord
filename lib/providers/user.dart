import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  var userStatus = 'Online';

  void setStatus(status) {
    userStatus = status;
  }

  final bottomDrawerKey = GlobalKey();

  Icon returnStatusIcon(String status, double dimension) {
    if (status == 'Online') {
      return Icon(
        Icons.brightness_1,
        color: Colors.green,
        size: dimension,
      );
    } else if (status == 'Idle') {
      return Icon(
        Icons.brightness_2,
        color: Colors.yellow,
        size: dimension,
      );
    } else if (status == 'Do Not Disturb') {
      return Icon(
        Icons.remove_circle,
        color: Colors.red,
        size: dimension,
      );
    } else if (status == 'Invisible') {
      return Icon(
        Icons.adjust,
        color: Colors.grey,
        size: dimension,
      );
    } else if (status == 'Offline') {
      return Icon(
        Icons.brightness_1,
        color: Colors.white,
        size: dimension,
      );
    }
    notifyListeners();
  }
}
