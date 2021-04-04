import 'package:movieapp2/UI/movie_list/movie_list_provider.dart';
import 'package:movieapp2/UI/favourit_movies/movie_nofavouritFound_widget.dart';
import 'package:movieapp2/UI/movie_list/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:provider/provider.dart';

class FavMoviesScreen extends StatelessWidget {
  FavMoviesScreen({Key key, this.title, this.movies}) : super(key: key);

  final String title;
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
        builder: (buildContext, movieRepository, _) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Color(0xFF151C26),
            appBar: AppBar(
              title: Text('Favorite Movies'),
              backgroundColor: Colors.black,
            ),
            body:
                (movieRepository.movies.where((m) => m.fav).toList().length > 0)
                    ? ListView.builder(
                        itemCount: movieRepository.movies
                            .where((m) => m.fav)
                            .toList()
                            .length,
                        itemBuilder: (ctx, index) {
                          final movie = movieRepository.movies
                              .where((m) => m.fav)
                              .toList()[index];
                          final movieindex = index;
                          return MovieArray(
                            movie: movie,
                            index: movieindex,
                          );
                        })
                    : NoFileScreen(),
          ));
    });
  }
}
