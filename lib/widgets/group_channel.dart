import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sub_channel.dart';
import '../providers/main_provider.dart';

import '../screens/chat_screen.dart';

class GroupChannel extends StatefulWidget {
  final String name;
  final List<SubChannel> subChannels;

  GroupChannel({this.name, this.subChannels});

  @override
  _GroupChannelState createState() => _GroupChannelState();
}

class _GroupChannelState extends State<GroupChannel>
    with SingleTickerProviderStateMixin {
  bool expanded = true;
  bool expandedDelayDone = true;
  AnimationController _arrowController;
  Animation<double> _arrowRotation;

  @override
  void initState() {
    

    
    _arrowController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 275),
    );
    _arrowRotation =
        Tween<double>(begin: 90 / 360, end: 0 / 360).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: _arrowController,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final main = Provider.of<Main>(context, listen: false);
    return AnimatedContainer(
      duration: Duration(milliseconds: 275),
      height: expanded ? 35.0 + widget.subChannels.length * 35 : 35,
      child: Column(
        children: <Widget>[
          Container(
            height: 35,
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (expanded) {
                      _arrowController.forward();
                    } else {
                      _arrowController.reverse();
                    }
                    expanded = !expanded;
                    if (!expanded) {
                      expandedDelayDone = !expandedDelayDone;
                    } else {
                      Timer(new Duration(milliseconds: 300), () {
                        setState(() {
                          expandedDelayDone = !expandedDelayDone;
                        });
                      });
                    }
                  });
                },
                splashColor: Colors.white24,
                child: Container(
                  height: 25,
                  child: Row(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _arrowController,
                        builder: (ctx, child) => RotationTransition(
                          turns: AlwaysStoppedAnimation(_arrowRotation.value),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white54,
                            size: 20,
                          ),
                        ),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (expandedDelayDone)
            ...widget.subChannels.map(
              (subChannel) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                    main.setSelectedScreen(
                        screen: 'GroupChat', currentSubChannel: subChannel);
                Navigator.of(context).pushReplacementNamed(ChatScreen.routeName);
                    },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: main.selectedSubChannel == subChannel
                        ? Theme.of(context).canvasColor
                        : null,
                  ),
                  height: 35,
                  child: Row(
                    children: <Widget>[
                      subChannel.private
                          ? Container(
                              alignment: Alignment.center,
                              width: 20,
                              child: Icon(
                                Icons.lock,
                                color: Colors.white54,
                                size: 18,
                              ),
                            )
                          : Container(
                              width: 20,
                              alignment: Alignment.center,
                              child: Text(
                                '#',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 22),
                              ),
                            ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.code,
                        color: Colors.blue,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 22,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 2),
                      Container(
                        width: 145,
                        child: Text(
                          subChannel.name,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                              color: subChannel.unreadMessages > 0
                                  ? Colors.white
                                  : Colors.white70,
                              fontSize: 16,
                              fontWeight: subChannel.unreadMessages > 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                      Spacer(),
                      if (subChannel.unreadMessages > 0)
                        Container(
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          height: 21,
                          width: 21,
                          child: FittedBox(
                            child: Text(
                              subChannel.unreadMessages.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
