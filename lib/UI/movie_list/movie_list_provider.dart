import 'package:flutter/material.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/models/movie_trailer.dart';
import 'package:movieapp2/repositories/movie_repository.dart';

class MoviesProvider extends ChangeNotifier {
  List<Movie> movies = [];
  MovieTrailer movieTrailer;
  static int favMovieCount = 0;
  static int startingPage = 1;
  String searchResult;

  MovieRepository _movieRepository = MovieRepository();
  ScrollController scrollController = new ScrollController();

  MoviesProvider() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        startingPage++;
        getMovies();
      }
    });
    if (startingPage == 1) {
      getMovies();
    }
    searchingMovies(searchResult);
  }

  void getMovies() {
    _movieRepository.fetchMovies(startingPage).then((newMovie) {
      movies.addAll(newMovie);
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

    notifyListeners();
  }

  void searchingMovies(searchResults) {
    if (searchResults != null) {
      searchResult = searchResults;
    }
    notifyListeners();
  }
}
