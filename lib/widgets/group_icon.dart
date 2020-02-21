import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/groups.dart';

class GroupIcon extends StatefulWidget {
  final Group group;

  GroupIcon(this.group);

  @override
  _GroupIconState createState() => _GroupIconState();
}

class _GroupIconState extends State<GroupIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _borderController;
  Animation<double> _borderAnimation;

  @override
  void initState() {
    super.initState();
    _borderController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 275),
    );
    _borderAnimation = Tween<double>(
      begin: 25,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _borderController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _borderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Groups>(context);

    if (widget.group.id == groups.currentlySelectedId) {
      _borderController.forward();
    }
    else{
      _borderController.reverse();
    }

    return GestureDetector(
      onTap: () {
        if (widget.group.id != groups.currentlySelectedId) {
          groups.setCurId(widget.group.id);
        }
      },
      child: Container(
        width: 75,
        height: 60,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -5,
              height: 60,
              width: 10,
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: Curves.easeIn,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  height:
                      widget.group.id == groups.currentlySelectedId ? 30 : 10,
                ),
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _borderController,
                builder: (ctx, child) => ClipRRect(
                  borderRadius: BorderRadius.circular(_borderAnimation.value),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      widget.group.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
