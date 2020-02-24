import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';

class UserIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              width: 80,
              height: 80,
              child: Center(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTAW9ooGa2MV5zyQVh1K7hEZULarlv7wAiPGmfc5uAsgngN_99',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              height: 25,
              width: 25,
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(1),
                  child: Consumer<User>(
                    builder: (ctx, user, ch) =>
                        user.returnStatusIcon(user.userStatus, 24),
                  )),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'User Name',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
