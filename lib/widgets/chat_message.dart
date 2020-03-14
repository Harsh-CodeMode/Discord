import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';
import '../providers/message_box.dart';
import '../providers/main_provider.dart';

import '../widgets/user_icon.dart';

class ChatMessage extends StatelessWidget {
  int index;

  ChatMessage(this.index);

  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<Friends>(context);
    final friendId = Provider.of<Main>(context).friendId;
    final main = Provider.of<Main>(context, listen: false);

    final messages = main.selectedScreen == 'FriendChat'
        ? Provider.of<Friends>(context, listen: false)
            .friendList[friends.currentlySelectedId]['messages']
        : main.selectedSubChannel.messages;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (index == messages.length - 1)
          main.selectedScreen == 'FriendChat'
              ? Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    UserIcon(
                      name: friends.friendList[friendId]['name'],
                      imageUrl: friends.friendList[friendId]['imageUrl'],
                      status: friends.friendList[friendId]['status'],
                    ),
                    SizedBox(height: 20),
                  ],
                )
              : Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Channel -> ${main.selectedSubChannel.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
        Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.white38,
              ),
            ),
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: TextStyle(color: Colors.white38),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.white38,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                child: Image.network(
                  friends.friendList[friendId]['imageUrl'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 2),
                Text(
                  friends.friendList[friendId]['name'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Consumer<MessageBox>(
                  builder: (context, messageBox, ch) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...(messages[index].messageList as List).map(
                        (message) => Column(
                          children: <Widget>[
                            Text(
                              message,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
