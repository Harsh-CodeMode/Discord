import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/groups.dart';

class RDrawerTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Groups>(context, listen: false);
    return Container(
      height: 110,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 45),
          groups.currentlySelectedId == 0
              ? Container(
                  height: 35,
                  width: 225,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Find or start a conversation',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                          fillColor: Colors.black38,
                          filled: true,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ))
              : Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    groups.groupList[groups.currentlySelectedId].name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
