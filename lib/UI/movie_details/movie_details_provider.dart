import 'package:flutter/material.dart';
import 'package:movieapp2/models/movie_details.dart';
import 'package:movieapp2/models/movie_trailer.dart';
import 'package:movieapp2/repositories/movie_repository.dart';

class MovieDtailsProvider extends ChangeNotifier {
  MovieDtails movieDetails;
  MovieTrailers movieTrailer;

  MovieRepository _movieRepository = MovieRepository();

  MovieDtailsProvider(id) {
    getMovieDetails(id);
  }

  void getMovieDetails(id) {
    _movieRepository.fetchMovieDetails(id).then((newMovieDetails) {
      movieDetails = newMovieDetails;
      _movieRepository.fetchMovieTrailers(id).then((newMovieTrailer) {
        movieTrailer = newMovieTrailer;
        notifyListeners();
      });
    });
  }
}
