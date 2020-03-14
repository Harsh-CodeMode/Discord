import 'package:discord/providers/friends.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/groups.dart';

import '../widgets/r_drawer_top.dart';
import '../widgets/direct_message.dart';
import '../widgets/rdrawer_group_channels.dart';

class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Groups>(context);
    final friends = Provider.of<Friends>(context, listen: false);
    final deviceHeight = MediaQuery.of(context).size.height;
    final double rightDrawerWidth = 265;
    return Container(
      color: Theme.of(context).accentColor,
      height: deviceHeight - 55,
      width: rightDrawerWidth,
      child: Column(
        children: <Widget>[
          RDrawerTop(),
          groups.currentlySelectedId == 0
              ? Container(
                  height: deviceHeight - 165,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemBuilder: (ctx, i) => DirectMessage(
                      messageNumber: friends.friendList[i]['messageNumber'],
                      imageUrl: friends.friendList[i]['imageUrl'],
                      first: friends.friendList[i]['first'],
                      name: friends.friendList[i]['name'],
                      id: friends.friendList[i]['id'],
                      status: friends.friendList[i]['status'],
                    ),
                    itemCount: friends.friendList.length,
                  ),
                )
              : RDrawerGroupChannels(),
        ],
      ),
    );
  }
}
