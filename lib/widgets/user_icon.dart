import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';

class UserIcon extends StatelessWidget {
  String name;
  String imageUrl;
  String status;

  UserIcon({this.imageUrl, this.name, this.status});

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
                        imageUrl == null
                            ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTAW9ooGa2MV5zyQVh1K7hEZULarlv7wAiPGmfc5uAsgngN_99'
                            : imageUrl,
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
                    builder: (ctx, user, ch) => status == null
                        ? user.returnStatusIcon(user.userStatus, 24)
                        : user.returnStatusIcon(status, 24),
                  )),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            name == null ? 'User Name' : name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
