import 'dart:async';

import 'package:discord/screens/friends_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';

class DirectMessage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int messages;
  final bool first;
  final int id;

  DirectMessage({this.name, this.imageUrl, this.messages, this.first, this.id});

  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<Friends>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: first ? () {
            friends.setCurId(id);
            Timer(
                new Duration(milliseconds: 200),
                () => Navigator.of(context)
                    .pushReplacementNamed(FriendsScreen.routeName));
          } : () {
            friends.setCurId(id);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 275),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
                color: friends.currentlySelectedId == id
                    ? Theme.of(context).canvasColor
                    : null,
                borderRadius: BorderRadius.circular(5)),
            height: first ? 50 : 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(first ? 14 : 16),
                      child: first
                          ? Icon(
                              Icons.person,
                              size: 28,
                              color: Colors.white60,
                            )
                          : Container(
                              height: 32,
                              width: 32,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: messages == 0 ? 179 : 159,
                      child: Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                if (messages != null && messages > 0)
                  Container(
                    padding: EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: FittedBox(
                      child: Center(
                        child: Text(
                          '${messages}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (first)
          Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                    'DIRECT MESSAGES',
                    style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          )
      ],
    );
  }
}
