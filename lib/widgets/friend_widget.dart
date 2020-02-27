import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/friends.dart';

class FriendWidget extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String name;

  FriendWidget({this.imageUrl, this.status, this.name});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final friends = Provider.of<Friends>(context, listen: false);
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 14,
                right: 14,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).accentColor),
                  padding: EdgeInsets.all(1),
                  child: friends.returnStatusIcon(status, 14),
                ),
              )
            ],
          ),
          Container(
            width: deviceWidth - 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  status,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
