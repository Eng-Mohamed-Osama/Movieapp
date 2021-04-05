import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp2/UI/actors_list/actors_screen.dart';
import 'package:movieapp2/UI/movie_list/movie_widget.dart';
import 'package:provider/provider.dart';
import 'Nav.dart';
import 'UI/actors_list/actors_list_provider.dart';
import 'UI/movie_list/movie_list_provider.dart';
import 'UI/search_movies/search_movies_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
          child: MovieArray(),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
          child: SearchScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => ActorProvider(),
          child: ActorsScreen(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie Land',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Nav(),
      ),
    );
  }
}
