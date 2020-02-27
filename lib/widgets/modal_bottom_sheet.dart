import 'package:discord/widgets/drawer_bottom.dart';
import 'package:flutter/material.dart';
import '../widgets/user_status.dart';

class ModalBottomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final modalHeight = MediaQuery.of(context).size.height / 2.2;
    return Container(
      height: modalHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: (modalHeight * 0.16) - 1,
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Set Status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          UserStatus(
            userStatusHeight: modalHeight * 0.18,
            icon: Icon(
              Icons.brightness_1,
              color: Colors.green,
              size: 20,
            ),
            title: 'Online',
            content: '',
          ),
          UserStatus(
            userStatusHeight: modalHeight * 0.18,
            icon: Icon(
              Icons.brightness_2,
              color: Colors.yellow,
              size: 20,
            ),
            title: 'Idle',
            content: '',
          ),
          UserStatus(
            userStatusHeight: modalHeight * 0.22,
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
              size: 20,
            ),
            title: 'Do Not Disturb',
            content: 'You will not recieve any desktop notifications',
          ),
          UserStatus(
            userStatusHeight: modalHeight * 0.24,
            icon: Icon(
              Icons.adjust,
              color: Colors.grey,
              size: 20,
            ),
            title: 'Invisible',
            content:
                'You will not appear online, but will have full access to all of Discord.',
          ),
        ],
      ),
    );
  }
}
