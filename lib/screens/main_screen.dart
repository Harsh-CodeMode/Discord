import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/main_provider.dart';
import '../providers/friends.dart';
import '../providers/chat.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/friends_scr_top.dart';
import '../widgets/friends_scr_body.dart';
import '../widgets/chat_message.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = '/main_screen';

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final messages = Provider.of<Chat>(context, listen: false).messages;
    final friendList = Provider.of<Friends>(context, listen: false).friendList;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double deviceHeight = MediaQuery.of(context).size.height;
    const appBarHeight = 56;
    final friendId = Provider.of<Main>(context, listen: false).friendId;
    return Consumer<Main>(
      child: CustomDrawer(),
      builder: (ctx, main, ch) => Scaffold(
        drawer: ch,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).accentColor,
          title: main.selectedScreen == 'Friends'
              ? Text('Friends')
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
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height:
                          deviceHeight - statusBarHeight - appBarHeight - 40,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        reverse: true,
                        itemBuilder: (ctx, i) => ChatMessage(i),
                        itemCount: messages.length,
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border(
                          top: BorderSide(color: Colors.black26, width: 1),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: deviceWidth - 40,
                              padding: EdgeInsets.only(left: 10),
                              child: TextField(
                                autofocus: false,
                                style: TextStyle(color: Colors.white60),
                                decoration: InputDecoration(
                                  hintText: 'Message your friend',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white30),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Theme.of(context).accentColor,
                            customBorder: CircleBorder(),
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white30,
                                  size: 25,
                                )),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
