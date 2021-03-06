import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';

class FriendsScrTop extends StatefulWidget {
  @override
  _FriendsScrTopState createState() => _FriendsScrTopState();
}

class _FriendsScrTopState extends State<FriendsScrTop> {
  var currentlySelectedIndex = 0;

  final GlobalKey _everyoneKey = GlobalKey();
  final GlobalKey _onlineKey = GlobalKey();
  final GlobalKey _idleKey = GlobalKey();
  final GlobalKey _offlinekey = GlobalKey();

  double _everyoneWidth;
  double _onlineWidth = 82;
  double _idleWidth;
  double _offlineWidth;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getWidth());
    super.initState();
  }

  void getWidth() {
      _everyoneWidth = _everyoneKey.currentContext.size.width;
      _onlineWidth = _onlineKey.currentContext.size.width;
      _idleWidth = _idleKey.currentContext.size.width;
      _offlineWidth = _offlinekey.currentContext.size.width;
    ;
  }

  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<Friends>(context, listen: false);
    return Container(
      height: 52,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    currentlySelectedIndex = 0;
                  });
                  friends.setScreenSelected("Online");
                },
                key: _onlineKey,
                splashColor: Theme.of(context).accentColor,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'ONLINE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentlySelectedIndex = 1;
                  });
                  friends.setScreenSelected("Idle");
                },
                key: _idleKey,
                splashColor: Theme.of(context).accentColor,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'IDLE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                key: _offlinekey,
                onTap: () {
                  setState(() {
                    currentlySelectedIndex = 2;
                  });
                  friends.setScreenSelected("Offline");
                },
                splashColor: Theme.of(context).accentColor,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'OFFLINE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                key: _everyoneKey,
                onTap: () {
                  setState(() {
                    currentlySelectedIndex = 3;
                  });
                  friends.setScreenSelected('Everyone');
                },
                splashColor: Theme.of(context).accentColor,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'EVERYONE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 275),
            top: 50,
            left: currentlySelectedIndex == 0
                ? 0
                : currentlySelectedIndex == 1
                    ? _onlineWidth
                    : currentlySelectedIndex == 2
                        ? _onlineWidth + _idleWidth
                        : currentlySelectedIndex == 3
                            ? _onlineWidth + _idleWidth + _offlineWidth
                            : 0,
            child: AnimatedContainer(
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 275),
              width: currentlySelectedIndex == 0
                  ? _onlineWidth
                  : currentlySelectedIndex == 1
                      ? _idleWidth
                      : currentlySelectedIndex == 2
                          ? _offlineWidth
                          : _everyoneWidth,
              color: Colors.white,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
