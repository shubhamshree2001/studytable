import 'package:STUDYtable/anim/custom_routes.dart';
import 'package:STUDYtable/anim/splash_screen.dart';
import 'package:STUDYtable/providers/student_provider.dart';
import 'package:STUDYtable/screens/physics.dart';
import 'package:STUDYtable/screens/update_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'dummy_data.dart';
import 'models/subjects.dart';
import 'models/updates.dart';

void main() {
  runApp(MyApp());
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Updates> _favoriteposts = [];
  void _toggleFavorite(String postId) {
    final existingIndex =
        _favoriteposts.indexWhere((post) => post.id == postId);
    if (existingIndex >= 0) {
      setState(
        () {
          _favoriteposts.removeAt(existingIndex);
        },
      );
    } else {
      setState(() {
        _favoriteposts.add(DUMMY_POSTS.firstWhere((post) => post.id == postId));
      });
    }
  }

  bool _isPostFavorite(String id) {
    return _favoriteposts.any((post) => post.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (bctx) => Subjects(),
        ),
        ChangeNotifierProvider(
          builder: (bctx) => StudentDataProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'STUDYtable',
          theme: ThemeData(
              pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          })),
          home: new Scaffold(
            body: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: SplashScreen(),
            ),
          ),
          routes: {
            MyHomePage.routeName: (ctx) => MyHomePage(),
            UpdatesDetailScreen.routeName: (ctx) =>
                UpdatesDetailScreen(_toggleFavorite, _isPostFavorite),
          }),
    );
  }
}
