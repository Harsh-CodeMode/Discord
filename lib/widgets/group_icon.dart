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
                  color: Theme.of(context).canvasColor,
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
              margin: EdgeInsets.only(
                top: widget.group.top != null ? 10 : 0,
                bottom: widget.group.bottom != null ? 10 : 0,
              ),
              width: 75,
              height: 60,
              child: Stack(
                children: <Widget>[
                  if (widget.group.messages != null &&
                      widget.group.messages > 0)
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
                    child: Stack(
                      children: <Widget>[
                        AnimatedBuilder(
                          animation: _borderController,
                          builder: (ctx, child) => ClipRRect(
                            borderRadius:
                                BorderRadius.circular(_borderAnimation.value),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 275),
                              color: widget.group.bottom != null
                                  ? Theme.of(context).accentColor
                                  : widget.group.top != null
                                      ? widget.group.id ==
                                              groups.currentlySelectedId
                                          ? Color(0xff7289da)
                                          : Theme.of(context).accentColor
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
                        if (widget.group.messages != null &&
                            widget.group.messages > 0)
                          Positioned(
                            right: -2,
                            bottom: -2,
                            height: 22,
                            width: 22,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.all(2),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: FittedBox(
                                  child: Center(
                                    child: Text(
                                      '${widget.group.messages}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
//sdf