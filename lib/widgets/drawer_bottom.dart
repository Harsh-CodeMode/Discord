import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/user_settings.dart';

import '../providers/user.dart';

import '../widgets/modal_bottom_sheet.dart';

class DrawerBottom extends StatefulWidget {
  DrawerBottom({Key key}) : super(key: key);

  @override
  _DrawerBottomState createState() => _DrawerBottomState();
}

class _DrawerBottomState extends State<DrawerBottom> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final double drawerWidth = 340;

    return Container(
      height: 55,
      width: drawerWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.white30,
              onTap: () {
                Timer(new Duration(milliseconds: 200), () {
                  showModalBottomSheet(
                      context: context, builder: (ctx) => ModalBottomSheet());
                });
              },
              child: Container(
                width: 275,
                height: 60,
                child: Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 75,
                          padding: EdgeInsets.only(left: 15, right: 28),
                          child: Center(
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTAW9ooGa2MV5zyQVh1K7hEZULarlv7wAiPGmfc5uAsgngN_99',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 25,
                          bottom: 9,
                          height: 13,
                          width: 13,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                shape: BoxShape.circle),
                            child: user.returnStatusIcon(user.userStatus),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        'User Name',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {},
                  splashColor: Theme.of(context).primaryColor,
                  child: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      splashColor: Colors.white10,
                      onPressed: () {
                        Navigator.of(context).pushNamed(UserSettings.routeName);
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
