import 'package:discord/widgets/group_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/groups.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Groups>(context, listen: false);
    final deviceHeight = MediaQuery.of(context).size.height;
    final double leftDrawerWidth = 75;
    return Container(
      height: deviceHeight - 55,
      color: Theme.of(context).primaryColor,
        width: leftDrawerWidth,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return GroupIcon(groups.groupList[i]);
          },
          itemCount: groups.groupList.length,
        ),
    );
  }
}
