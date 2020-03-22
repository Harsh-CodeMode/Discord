import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';
import '../providers/message_box.dart';
import '../providers/main_provider.dart';

import '../widgets/user_icon.dart';

class ChatMessage extends StatelessWidget {
  final int index;
  final String date;
  final String time;
  final bool newDate;
  final bool loading;

  ChatMessage({this.index, this.newDate, this.date, this.time, this.loading});

  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<Friends>(context, listen: false);
    final main = Provider.of<Main>(context, listen: false);
    final deviceWidth = MediaQuery.of(context).size.width;

    final messages = main.selectedScreen == 'FriendChat'
        ? Provider.of<Friends>(context, listen: false)
            .friendList[friends.currentlySelectedId]['messages']
        : main.selectedSubChannel.messages;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (index == messages.length - 1)
          loading
              ? Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                )
              : (main.selectedScreen == 'FriendChat'
                  ? Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        UserIcon(
                          name: friends.friendList[main.friendId]['name'],
                          imageUrl: friends.friendList[main.friendId]
                              ['imageUrl'],
                          status: friends.friendList[main.friendId]['status'],
                        ),
                        SizedBox(height: 20),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Center(
                          child: Text(
                            main.selectedSubChannel.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    )),
        if (newDate)
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.white38,
                ),
              ),
              Text(
                date,
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
        (date != '' && time != '')
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Image.network(
                        friends.friendList[main.friendId]['imageUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 2),
                      Container(
                        width: deviceWidth - 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: deviceWidth - 180),
                              child: Text(
                                friends.friendList[main.friendId]['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              time,
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ...(messages[index].messageList as List).map(
                            (message) => Column(
                              children: <Widget>[
                                Container(
                                  width: deviceWidth - 100,
                                  child: Text(
                                    message,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            : Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Start a conversation',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 1,
                    color: Colors.white38,
                  ),
                ],
              ),
        SizedBox(height: 10),
      ],
    );
  }
}
