import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';
import '../providers/chat.dart';
import '../providers/main_provider.dart';

import '../widgets/user_icon.dart';

class ChatMessage extends StatelessWidget {
  int index;

  ChatMessage(this.index);

  @override
  Widget build(BuildContext context) {
    final friendList = Provider.of<Friends>(context).friendList;
    final friendId = Provider.of<Main>(context).friendId;
    final messages = Provider.of<Chat>(context, listen: false).messages;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        index == messages.length - 1
            ? Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  UserIcon(
                    name: friendList[friendId]['name'],
                    imageUrl: friendList[friendId]['imageUrl'],
                    status: friendList[friendId]['status'],
                  ),
                  SizedBox(height: 20),
                ],
              )
            : Container(),
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
                  friendList[friendId]['imageUrl'],
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
                  friendList[friendId]['name'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...(messages[index]['messageList'] as List).map(
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
                )
              ],
            )
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
