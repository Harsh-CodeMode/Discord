import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class UserStatus extends StatelessWidget {
  final double userStatusHeight;
  final Icon icon;
  final String title;
  final String content;

  UserStatus({this.userStatusHeight, this.title, this.content, this.icon});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    return Material(
      child: InkWell(
        onTap: () {
          user.setStatus(title);
          user.bottomDrawerKey.currentState.setState((){});
          Timer(new Duration(milliseconds: 200), ()
          {
            Navigator.of(context).pop();
          });

        },
        splashColor: Colors.white,
        child: Container(
          height: userStatusHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      child: Center(child: icon),
                    ),
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              if (content != '') SizedBox(height: 5),
              if (content != '')
                Container(
                  padding: EdgeInsets.only(left: 60, right: 20),
                  child: Text(
                    content,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
