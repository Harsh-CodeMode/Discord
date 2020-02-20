import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/groups.dart';

import '../widgets/left_drawer.dart';
import '../widgets/right_drawer.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double drawerWidth = 340;
    return ChangeNotifierProvider.value(
      value: Groups(),
      child: Container(
        height: double.infinity,
        width: drawerWidth,
        child: Row(
          children: <Widget>[
            LeftDrawer(),
            RightDrawer(),
          ],
        ),
      ),
    );
  }
}
