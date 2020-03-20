import 'package:flutter/material.dart';
import '../widgets/setting.dart';
import '../widgets/user_icon.dart';
import '../helpers//settings_data.dart';

class UserSettings extends StatefulWidget {
  static const routeName = '/user_settings';

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  var _topContainerPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
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
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              _topContainerPosition =
                  _topContainerPosition + notification.scrollDelta / 2;
            });
          }
        },
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Positioned(
                  top: _topContainerPosition,
                  child: Container(
                    height: 150,
                    width: deviceWidth,
                    color: Theme.of(context).primaryColor,
                    child: UserIcon(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150),
                  child: Container(
                    color: Theme.of(context).canvasColor,
                    child: Column(
                      children: <Widget>[
                        ...settings.map((setting) => Setting(setting)).toList()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}