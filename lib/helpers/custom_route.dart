import 'package:flutter/cupertino.dart';

class CustomRoute extends PageRouteBuilder {
  Widget screenWidget;

  CustomRoute({screenWidget})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return screenWidget;
          },

          transitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Animation<Offset> custom = Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ).animate(animation);

            return SlideTransition(
              position: custom,
              child: child,
            );
          },
        );
}
