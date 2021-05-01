import 'package:movieapp2/UI/movie_list/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/colors.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child:
            Consumer<AppProvider>(builder: (buildContext, moviesProvider, _) {
          return Scaffold(
              backgroundColor: ColorsCollection.mainColor,
              body: (moviesProvider.movies != null)
                  ? ListView.builder(
                      controller: moviesProvider.scrollController,
                      itemCount: moviesProvider.movies.length,
                      itemBuilder: (ctx, index) {
                        final movie = moviesProvider.movies[index];
                        return MovieArray(
                          movie: movie,
                          index: movie.id,
                        );
                      })
                  : Center(child: CircularProgressIndicator()));
        }));
  }
}
