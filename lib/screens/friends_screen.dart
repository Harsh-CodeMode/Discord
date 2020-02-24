import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

import '../widgets/custom_drawer.dart';

class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff23272a),
        title: Text('Discord'),
      ),
      body: Container(
        color: Color(0xff2c2f33),
      ),
    );
  }
}
