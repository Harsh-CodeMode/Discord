import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/groups.dart';

import '../widgets/group_channel.dart';

class RDrawerGroupChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Groups>(context, listen: false);
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight - 165,
      child: ListView(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        children: <Widget>[
          Container(

            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black87,
                onTap: () {},
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white24,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Invite Members',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.lock,
                    color: Colors.white54,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Member Count ${groups.groupList[groups.currentlySelectedId].memberCount}',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ...(groups.groupList[groups.currentlySelectedId].channels as List)
              .map((channel) => GroupChannel(
                    name: channel['name'],
                    subChannels: channel['subChannels'],
                  ))
        ],
      ),
    );
  }
}
