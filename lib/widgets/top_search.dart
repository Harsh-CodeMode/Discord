import 'package:flutter/material.dart';

class TopSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 45),
          Container(
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
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
