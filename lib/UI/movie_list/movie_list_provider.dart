import 'package:flutter/material.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/models/movie_trailer.dart';
import 'package:movieapp2/repositories/movie_repository.dart';

class MoviesProvider extends ChangeNotifier {
  List<Movie> movies;
  MovieTrailer movieTrailer;
  static int favMovieCount = 0;
  String searchResult;

  MovieRepository _movieRepository = MovieRepository();

  MoviesProvider() {
    getMovies();
    filterMovies(searchResult);
  }

  void getMovies() {
    _movieRepository.fetchMovies().then((newMovie) {
      movies = newMovie;
      notifyListeners();
    });
  }

  void filterMovies(searchResult) {
    _movieRepository.fetchMovies().then((newMovie) {
      movies = newMovie.where((m) => m.title
          .toLowerCase()
          .contains(searchResult.toString().toLowerCase()));
      notifyListeners();
    });
  }

  int get getCount => favMovieCount;

  void addToFav(Movie movie) {
    movie.fav = !movie.fav;
    if (movie.fav) {
      favMovieCount++;
    } else {
      favMovieCount--;
    }
    print(favMovieCount);

    notifyListeners();
  }

  void searchingMovies(searchResults) {
    searchResult = searchResults;
    print(searchResult);

    notifyListeners();
  }
}
