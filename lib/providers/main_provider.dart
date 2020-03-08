import 'package:flutter/material.dart';

class Main extends ChangeNotifier {
  var selectedScreen = 'Friends';
  int friendId;

  void setSelectedScreen(String screen, int id){
    selectedScreen = screen;
    friendId = id;
    notifyListeners();
  }
}