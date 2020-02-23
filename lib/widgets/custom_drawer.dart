import 'package:discord/widgets/user_status.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/friends.dart';
import '../providers/groups.dart';
import '../providers/user.dart';

import '../widgets/left_drawer.dart';
import '../widgets/right_drawer.dart';
import '../widgets/drawer_bottom.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 final user = Provider.of<User>(context,listen: false);
    final deviceHeight = MediaQuery.of(context).size.height;
    final double drawerWidth = 340;
    return Column(
      children: <Widget>[
        Container(
          height: deviceHeight - 55,
          width: drawerWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LeftDrawer(),
              RightDrawer(),
            ],
          ),
        ),
        DrawerBottom(key : user.bottomDrawerKey),
      ],
    );
  }
}
