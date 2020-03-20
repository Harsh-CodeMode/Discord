import 'package:cloud_firestore/cloud_firestore.dart';
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Consumer<Main>(
      child: CustomDrawer(),
      builder: (ctx, main, ch) => Scaffold(
          drawer: ch,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).accentColor,
              title: Text('Friends'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ]),
          body: Column(
            children: <Widget>[
              FriendsScrTop(),
              FriendsScrBody(statusBarHeight),
            ],
          )),
    );
  }
}
