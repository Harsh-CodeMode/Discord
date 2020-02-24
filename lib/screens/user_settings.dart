import 'package:flutter/material.dart';
import '../widgets/setting.dart';
import '../data/settings_data.dart';

class UserSettings extends StatelessWidget {
  static const routeName = 'User Settings';

  @override
  Widget build(BuildContext context) {


    final deviceheight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    const appBarHeight = 56;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('User Settings'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.subdirectory_arrow_right,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.blue,
        ),
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        height: deviceheight - statusBarHeight - appBarHeight,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (ctx, i) => Setting(settings[i]),
          itemCount: settings.length,

        ),
      ),
    );
  }
}
