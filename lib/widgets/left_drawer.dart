import 'package:discord/widgets/group_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/groups.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Groups>(context, listen: false);
    final double leftDrawerWidth = 75;
    return Container(
      color: Color(0xff23272a),
      height: double.infinity,
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
