import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/main_provider.dart';
import '../providers/friends.dart';
import '../providers/groups.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/friends_scr_top.dart';
import '../widgets/friends_scr_body.dart';
import '../widgets/chat_box.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = '/main_screen';

  final chatController = TextEditingController;

  @override
  Widget build(BuildContext context) {

    final friendList = Provider.of<Friends>(context, listen: false).friendList;
    final groups = Provider.of<Groups>(context,listen: false);
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Consumer<Main>(
      child: CustomDrawer(),
      builder: (ctx, main, ch) => Scaffold(
          drawer: ch,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).accentColor,
            title: main.selectedScreen == 'Friends'
                ? Text('Friends'):
                main.selectedScreen == 'GroupChat' ? Text(main.selectedSubChannel.name)
                : Text(friendList[main.friendId]['name']),
            actions: main.selectedScreen == 'Friends'
                ? <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ]
                : <Widget>[
                    IconButton(
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
          body: main.selectedScreen == 'Friends'
              ? Column(
                  children: <Widget>[
                    FriendsScrTop(),
                    FriendsScrBody(statusBarHeight),
                  ],
                )
              : ChatBox(statusBarHeight)),
    );
  }
}
