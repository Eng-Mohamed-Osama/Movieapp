import 'package:flutter/material.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/repositories/movie_repository.dart';

class FavMoviesProvider extends ChangeNotifier {
  List<Movie> movies;
  MovieRepository _movieRepository = MovieRepository();

  FavMoviesProvider() {
    getFavMovies();
  }

  void getFavMovies() {
    _movieRepository.fetchMovies().then((newMovie) {
      var favmovies = newMovie.where((Movie f) => f.fav == true).toList();
      movies = newMovie;
      print(favmovies);
      notifyListeners();
    });
  }
}
