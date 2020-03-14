import 'package:flutter/material.dart';

import '../providers/sub_channel.dart';

class Main extends ChangeNotifier {
  var selectedScreen = 'Friends';
  int friendId = 1;
  SubChannel selectedSubChannel;


  void setSelectedScreen({String screen, int id, SubChannel currentSubChannel}){
    selectedScreen = screen;
    if (id != null) {
      friendId = id;
    }
    else{
      selectedSubChannel = currentSubChannel;
    }
    notifyListeners();
  }
}