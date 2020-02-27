import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

import '../widgets/custom_drawer.dart';

class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
//  final GlobalKey all = GlobalKey();
//  final GlobalKey online = GlobalKey();
//  final GlobalKey offline = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).accentColor,
      title: Text('Friends'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person_add, color: Colors.white),
        )
      ],
    );


    final double deviceHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarheight = appBar.preferredSize.height;

    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: appBar,
      body: Column(
        children: <Widget>[
//          Container(
//            color: Colors.blue,
//            height: 50,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  alignment: Alignment.center,
//                  child: Text('ALL'),
//                ),
//                Container(
//                  alignment: Alignment.center,
//                  child: Text('ONLINE'),
//                ),
//                Container(
//                  alignment: Alignment.center,
//                  child: Text('OFFLINE'),
//                ),
//              ],
//            ),
//          ),
          Container(),
          Container(
            height: deviceHeight - statusBarHeight - appBarheight - 50,
          ),
        ],
      ),
    );
  }
}
