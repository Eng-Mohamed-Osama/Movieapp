import 'package:badges/badges.dart';
import 'package:movieapp2/UI/favourit_movies/favourti_movies_screen.dart';
import 'package:movieapp2/UI/movie_list/movie_list_provider.dart';
import 'package:movieapp2/UI/movie_list/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetotpions = <Widget>[
    MoviesScreen(),
    MoviesScreen(),
  ];
  void _itemSwitch(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Consumer<MoviesProvider>(
            builder: (buildContext, moviesProvider, _) {
          var row = Row(
            children: [
              Text(
                'MovieLand',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    child: Badge(
                      animationType: BadgeAnimationType.scale,
                      shape: BadgeShape.circle,
                      badgeColor: Colors.red,
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                      ),
                      badgeContent: Text(
                          '${MoviesProvider.favMovieCount.toString()}',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FavMoviesScreen(
                              movies: moviesProvider.movies
                                  .where((m) => m.fav)
                                  .toList())))
                    },
                  ))
            ],
          );
          return Scaffold(
              backgroundColor: Color(0xFF151C26),
              appBar: AppBar(
                title: row,
                backgroundColor: Colors.black,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: 'Movies',
                    ),
                    Tab(
                      text: 'TV Shows',
                    ),
                  ],
                  onTap: _itemSwitch,
                ),
              ),
              body: _widgetotpions.elementAt(_selectedIndex));
        }));
  }
}
