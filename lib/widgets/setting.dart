import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final Map<String, Object> settingData;

  Setting(this.settingData);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Colors.black12,
        onTap: settingData['heading'] == true ? null : () {},
        child: Container(
          height: 60,
          width: deviceWidth,
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: settingData['heading'] != true
              ? Row(
                  children: <Widget>[
                    settingData['icon'],
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        settingData['title'],
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                )
              : Text(
                  settingData['title'],
                  style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
