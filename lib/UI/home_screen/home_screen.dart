import 'package:badges/badges.dart';
import 'package:movieapp2/UI/favourit_screen/favourti_movies_screen.dart';
import 'package:movieapp2/UI/movie_list/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/UI/tvShow_list/tvshow_screen.dart';
import 'package:movieapp2/colors.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:provider/provider.dart';

class HomeMovieTvshowscreen extends StatefulWidget {
  HomeMovieTvshowscreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeMovieTvshowscreenState createState() => _HomeMovieTvshowscreenState();
}

class _HomeMovieTvshowscreenState extends State<HomeMovieTvshowscreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetotpions = <Widget>[
    MoviesScreen(),
    TvshowScreen(),
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
        child:
            Consumer<AppProvider>(builder: (buildContext, moviesProvider, _) {
          var row = Row(
            children: [
              Text(
                'Movies & TV shows',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: ColorsCollection.secondaryColor,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    child: Badge(
                      animationType: BadgeAnimationType.scale,
                      shape: BadgeShape.circle,
                      badgeColor: ColorsCollection.secondaryColor,
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                      ),
                      badgeContent: Text(
                          '${moviesProvider.favMovieCount.toString()}',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FavMoviesScreen(
                                movies: moviesProvider.movies
                                    .where((m) => m.fav)
                                    .toList(),
                                shows: moviesProvider.shows
                                    .where((m) => m.fav)
                                    .toList(),
                              )))
                    },
                  ))
            ],
          );
          return Scaffold(
              appBar: AppBar(
                title: row,
                backgroundColor: ColorsCollection.mainColor,
                bottom: TabBar(
                  indicatorColor: ColorsCollection.secondaryColor,
                  labelColor: ColorsCollection.secondaryColor,
                  unselectedLabelColor: Colors.grey,
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
