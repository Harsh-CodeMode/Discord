import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/friends_scr_top.dart';
import '../widgets/friends_scr_body.dart';

import '../providers/friends.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = '/friends_screen';

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      drawer: CustomDrawer(),
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
        ],
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              FriendsScrTop(),
              FriendsScrBody(statusBarHeight),
            ],
          ),
        ],
      ),
    );
  }
}
