import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';
import '../providers/main_provider.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/chat_box.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/friends_screen';

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final friendList = Provider
        .of<Friends>(context, listen: false)
        .friendList;
    final main = Provider.of<Main>(context);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: main.selectedScreen == 'GroupChat'
            ? Text(main.selectedSubChannel.name)
            : Text(friendList[main.friendId]['name']),
        actions: <Widget>[
          if (main.selectedScreen == 'FriendChat') IconButton(
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body:ChatBox(statusBarHeight),
    );
  }
}
