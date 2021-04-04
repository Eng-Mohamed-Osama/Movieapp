import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/models/movie_details.dart';
import 'package:movieapp2/models/movie_trailer.dart';
import 'package:movieapp2/services/movie_service.dart';

class MovieRepository {
  MovieService _movieService = MovieService();

  Future<List<Movie>> fetchMovies() {
    return _movieService.fetchMovies();
  }

  Future<MovieDtails> fetchMovieDetails(id) {
    return _movieService.fetchMovieDetails(id);
  }

  Future<MovieTrailer> fetchMovieTrailers(id) {
    return _movieService.fetchMovieTrailers(id);
  }
}
