import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/friends_scr_top.dart';

class FriendsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).accentColor,
      title: Text('Friends'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person_add, color: Colors.white),
        )
      ],
    );

    final double deviceHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarheight = appBar.preferredSize.height;

    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: appBar,
      body: Column(
        children: <Widget>[
          FriendsScrTop(),
          Container(
            height: deviceHeight - statusBarHeight - appBarheight - 52,
          ),
        ],
      ),
    );
  }
}
