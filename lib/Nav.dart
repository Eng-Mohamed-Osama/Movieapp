import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/UI/home_screen/home_screen.dart';
import 'UI/actors_list/actors_screen.dart';
import 'UI/favourit_movies/favourti_movies_screen.dart';
import 'UI/search_movies/search_movies_screen.dart';
// import 'UI/movie_list/movie_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetotpions = <Widget>[
    Homescreen(),
    FavMoviesScreen(),
    SearchScreen(),
    ActorsScreen(),
  ];

  void _itemSwitch(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF151C26),
        items: <Widget>[
          Icon(
            Icons.movie,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.people,
            size: 25,
            color: Colors.white,
          ),
        ],
        onTap: _itemSwitch,
        height: 45,
        buttonBackgroundColor: Colors.black,
        color: Colors.black,
      ),
      body: _widgetotpions.elementAt(_selectedIndex),
    );
  }
}
