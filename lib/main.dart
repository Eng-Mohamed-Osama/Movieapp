import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp2/colors.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:movieapp2/provider/news_provider.dart';
import 'package:provider/provider.dart';
import 'Nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    FlutterStatusbarcolor.setStatusBarColor(ColorsCollection.mainColor);
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => MoviesProvider(),
        // ),
        // ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider('en', 1),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => ActorProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Movie Land',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Nav(),
      ),
    );
  }
}
