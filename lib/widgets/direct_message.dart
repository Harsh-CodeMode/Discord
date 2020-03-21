import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';
import '../providers/main_provider.dart';

import '../screens/chat_screen.dart';
import '../screens/friends_screen.dart';

class DirectMessage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int messageNumber;
  final bool first;
  final int id;
  final String status;

  DirectMessage(
      {this.name,
      this.imageUrl,
      this.messageNumber,
      this.first,
      this.id,
      this.status});

  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<Friends>(context);
    final main = Provider.of<Main>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            friends.setCurId(id);
              main.setSelectedScreen(
                screen: 'FriendChat',
                id: id,
              );
              Navigator.of(context).pop();
              if (friends.currentlySelectedId == 0){
                Navigator.of(context).pushReplacementNamed(FriendsScreen.routeName);
                return;
              }
              Navigator.of(context).pushReplacementNamed(ChatScreen.routeName);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 275),
            padding: EdgeInsets.only(right: 10, left: first ? 10 : 0),
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
                    first
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Icon(
                              Icons.person,
                              size: 32,
                              color: Colors.white60,
                            ),
                          )
                        : Stack(
                            children: <Widget>[
                              Container(
                                height: 60,
                                width: 55,
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Container(
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).accentColor),
                                    padding: EdgeInsets.all(1),
                                    child:
                                        friends.returnStatusIcon(status, 12)),
                              )
                            ],
                          ),
                    if (first) SizedBox(width: 15),
                    Container(
                      width: messageNumber == 0 ? 179 : 159,
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
                if (messageNumber != null && messageNumber > 0)
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
                          '${messageNumber}',
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
