import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/user_settings.dart';
import './screens/friends_screen.dart';

import './providers/user.dart';
import './providers/friends.dart';
import './providers/groups.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Groups()),
        ChangeNotifierProvider.value(value: Friends()),
        ChangeNotifierProvider.value(value: User()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Discord',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Color(0xff23272a), //left drawer
          accentColor: Color(0xff2c2f33), //right drawer
          canvasColor: Color(0xff393c41), // light right drawe
        ),
        routes: {
          '/': (ctx) => FriendsScreen(),
          UserSettings.routeName: (ctx) => UserSettings()
        },
      ),
    );
  }
}
