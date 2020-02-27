import 'package:discord/providers/friends.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/top_search.dart';
import '../widgets/direct_message.dart';

class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<Friends>(context, listen: false);
    final deviceHeight = MediaQuery.of(context).size.height;
    final double rightDrawerWidth = 265;
    return Container(
      color: Theme.of(context).accentColor,
      height: deviceHeight - 55,
      width: rightDrawerWidth,
      child: Column(
        children: <Widget>[
          TopSearch(),
          Container(
            height: deviceHeight - 165,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (ctx, i) => DirectMessage(
                messages: friends.friendList[i]['messages'],
                imageUrl: friends.friendList[i]['imageUrl'],
                first: friends.friendList[i]['first'],
                name: friends.friendList[i]['name'],
                id: friends.friendList[i]['id'],
                status: friends.friendList[i]['status'],
              ),
              itemCount: friends.friendList.length,
            ),
          ),
        ],
      ),
    );
  }
}
