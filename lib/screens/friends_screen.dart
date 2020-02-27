import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/friends_scr_top.dart';
import '../widgets/friend_widget.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = '/friends_screen';

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

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: appBar,
      body: Column(
        children: <Widget>[
          FriendsScrTop(),
          Container(
            height: deviceHeight - statusBarHeight - appBarheight - 52,
            child: Consumer<Friends>(
              builder: (context, friends, ch) => ListView.builder(
                itemBuilder: (context, i) =>
                    friends.friendList[i]['first'] != true &&
                            (friends.friendList[i]['status'] ==
                                    friends.friendsScreenSelected ||
                                friends.friendsScreenSelected == 'Everyone')
                        ? FriendWidget(
                            status: friends.friendList[i]['status'],
                            imageUrl: friends.friendList[i]['imageUrl'],
                            name: friends.friendList[i]['name'],
                          )
                        : Container(),
                itemCount: friends.friendList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
