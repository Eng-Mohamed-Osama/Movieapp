import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/models/movie_cast.dart';
import 'package:movieapp2/models/movie_details.dart';
import 'package:movieapp2/models/movie_trailer.dart';
import 'package:movieapp2/models/trending.dart';
import 'package:movieapp2/repositories/trending_repository.dart';
import 'package:movieapp2/services/movie_service.dart';

class MovieRepository {
  MovieService _movieService = MovieService();

  Future<List<Movie>> fetchMovies(startingPage) {
    return _movieService.fetchMovies(startingPage);
  }

  Future<MovieDtails> fetchMovieDetails(id) {
    return _movieService.fetchMovieDetails(id);
  }

  Future<MovieTrailers> fetchMovieTrailers(id) {
    return _movieService.fetchMovieTrailers(id);
  }

  Future<MovieCast> fetchMovieCast(id) {
    return _movieService.fetchMovieCast(id);
  }
}
