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
      height: double.infinity,
      color: Color(0xff23272a),
      child: Container(
        height: deviceHeight,
        width: leftDrawerWidth,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return GroupIcon(groups.groupList[i]);
          },
          itemCount: groups.groupList.length,
        ),
      ),
    );
  }
}
