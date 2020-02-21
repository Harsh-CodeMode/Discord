import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/groups.dart';

class GroupIcon extends StatelessWidget {
  final Group group;

  GroupIcon(this.group);

  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Groups>(context);
    return GestureDetector(
      onTap: () {
        groups.setCurId(group.id);
      },
      child: Container(
        width: 75,
        height: 60,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 1,
            ),
            groups.currentlySelectedId == group.id
                ? Container(
                    width: 5,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                    ),
                  )
                : ClipPath(
                    clipper: SemiCircle(),
                    child: Container(
                      width: 7,
                      height: 10,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(width: groups.currentlySelectedId == group.id ? 6.5 : 4.5),
            Container(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    group.id == groups.currentlySelectedId ? 10 : 1000),
                child: Image.network(
                  group.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SemiCircle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.quadraticBezierTo(7, 5, 0, 10);
    path.lineTo(0, 10);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

//class CurvedRectangle extends CustomClipper<Path> {
//  @override
//  Path getClip(Size size) {
//    // TODO: implement getClip
//    var path = new Path();
//    path.lineTo(5, 0);
//    path.lineTo(7,2);
//    path.lineTo(7,28);
//    path.lineTo(5,30);
//    path.lineTo(0, 30);
//    path.close();
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) {
//    // TODO: implement shouldReclip
//    return true;
//  }
//
//}

//lksdjfklsdj