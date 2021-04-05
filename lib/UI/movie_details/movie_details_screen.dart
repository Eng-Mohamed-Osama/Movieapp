import 'package:movieapp2/UI/movie_details/movie_detailsWidget.dart';
import 'package:movieapp2/models/movie_details.dart';
import 'movie_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({Key key, this.title, this.id, this.movies})
      : super(key: key);

  final String title;
  final id;
  final MovieDtails movies;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: ChangeNotifierProvider<MovieDtailsProvider>(
            create: (context) => MovieDtailsProvider(id),
            child: Consumer<MovieDtailsProvider>(
              builder: (buildContext, movieRepository, _) {
                final movieDetails = movieRepository.movieDetails;
                final movieTrailer = movieRepository.movieTrailer;
                return (movieRepository.movieDetails != null &&
                        movieTrailer != null)
                    ? MovieDetailsWidget(
                        index: id,
                        movie: movieDetails,
                        movieTrailers: movieTrailer,
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ));
  }
}
