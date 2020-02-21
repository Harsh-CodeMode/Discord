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
      end: 15,
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
    } else {
      _borderController.reverse();
    }

    return widget.group.line != null
        ? Container(
            width: double.infinity,
            height: 10,
            child: Center(
              child: Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Color(0xff99aab5),
                ),
              ),
            ),
          )
        : GestureDetector(
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
                        height: widget.group.id == groups.currentlySelectedId
                            ? 35
                            : 10,
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedBuilder(
                      animation: _borderController,
                      builder: (ctx, child) => ClipRRect(
                        borderRadius:
                            BorderRadius.circular(_borderAnimation.value),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 275),
                          color: widget.group.bottom != null
                              ? Color(0xff2c2f33)
                              : widget.group.top != null
                                  ? widget.group.id ==
                                          groups.currentlySelectedId
                                      ? Color(0xff7289da)
                                      : Color(0xff2c2f33)
                                  : null,
                          width: 50,
                          height: 50,
                          child: widget.group.bottom != null
                              ? Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ),
                                )
                              : widget.group.top != null
                                  ? Center(
                                      child: Icon(
                                        Icons.message,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Image.network(
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
