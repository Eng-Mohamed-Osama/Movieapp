import 'package:movieapp2/UI/favourit_movies/favourti_movies_screen.dart';
import 'package:movieapp2/UI/movie_list/movie_list_provider.dart';
import 'package:movieapp2/UI/movie_list/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Consumer<MoviesProvider>(
            builder: (buildContext, moviesProvider, _) {
          var row = Row(
            children: [
              Text('MovieLand'),
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
                ),
              ),
              body: (moviesProvider.movies != null)
                  ? ListView.builder(
                      itemCount: moviesProvider.movies.length,
                      itemBuilder: (ctx, index) {
                        final movie = moviesProvider.movies[index];
                        final movieindex = index;
                        return MovieArray(
                          movie: movie,
                          index: movieindex,
                        );
                      })
                  : Center(child: CircularProgressIndicator()));
        }));
  }
}
