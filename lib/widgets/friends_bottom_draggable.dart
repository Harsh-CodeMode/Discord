import 'package:discord/providers/user.dart';
import 'package:flutter/material.dart';
import './user_icon.dart';

class FriendsBottomDraggable extends StatelessWidget {
  String name;
  String imageUrl;
  String status;

  FriendsBottomDraggable({this.imageUrl, this.status, this.name});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(color: Colors.black12),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.36,
          maxChildSize: 0.7,
          minChildSize: 0,
          builder: (context, controller) => ListView(
            controller: controller,
            children: <Widget>[
              Container(
                height: deviceHeight * 0.72,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      height: deviceHeight * 0.36 - 50,
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          UserIcon(
                              name: name, imageUrl: imageUrl, status: status),
                          SizedBox(height: 10),
                          Divider(
                            thickness: 0.5,
                            color: Theme.of(context).canvasColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  splashColor: Theme.of(context).canvasColor,
                                  onTap: () {},
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 40,
                                        child: Icon(
                                          Icons.message,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Message',
                                        style: TextStyle(color: Colors.white70),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  splashColor: Theme.of(context).canvasColor,
                                  onTap: () {},
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 40,
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Call',
                                        style: TextStyle(color: Colors.white70),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  splashColor: Theme.of(context).canvasColor,
                                  onTap: () {},
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 40,
                                        child: Icon(
                                          Icons.videocam,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        'Video',
                                        style: TextStyle(color: Colors.white70),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: deviceHeight * 0.36  + 50,
                      width: double.infinity,
                      color: Theme.of(context).accentColor,
                      child: Center(
                        child: Text(
                          'Functionalities Yet to Add',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
