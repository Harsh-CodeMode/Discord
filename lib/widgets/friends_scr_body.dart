import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/friends.dart';

import '../widgets/friend_widget.dart';

class FriendsScrBody extends StatelessWidget {
  final double statusBarHeight;

  FriendsScrBody(this.statusBarHeight);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    const appBarheight = 56;
    return Container(
      height: deviceHeight - statusBarHeight - appBarheight - 52,
      child: Consumer<Friends>(
        builder: (context, friends, ch) => ListView.builder(
          padding: EdgeInsets.all(0),
          itemBuilder: (context, i) => friends.friendList[i]['first'] != true &&
                  (friends.friendList[i]['status'] ==
                          friends.friendsScreenSelected ||
                      friends.friendsScreenSelected == 'Everyone')
              ? FriendWidget(
                  status: friends.friendList[i]['status'],
                  imageUrl: friends.friendList[i]['imageUrl'],
                  name: friends.friendList[i]['name'],
                  id: friends.friendList[i]['id'])
              : Container(),
          itemCount: friends.friendList.length,
        ),
      ),
    );
  }
}
