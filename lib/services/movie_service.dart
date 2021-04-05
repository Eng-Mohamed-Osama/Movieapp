import 'dart:convert';
import 'package:movieapp2/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp2/models/movie_details.dart';
import 'package:movieapp2/models/movie_trailer.dart';

class MovieService {
  Future<List<Movie>> fetchMovies(startingPage) async {
    final response = await http.get(
        'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc&page=$startingPage');
    if (response.statusCode == 200) {
      return List<Movie>.from((json.decode(response.body)["results"] as List)
          .map((e) => Movie.fromJson((e)))).toList();
    } else {
      throw Exception('FAILED TO LOAD Movies');
    }
  }

  Future<MovieDtails> fetchMovieDetails(int id) async {
    var response = await http.get(
        'https://api.themoviedb.org/3/movie/$id?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US');
    if (response.statusCode == 200) {
      return movieDtailsFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD THE MOVIE Details');
    }
  }

  Future<MovieTrailers> fetchMovieTrailers(id) async {
    var response = await http.get(
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=6847b68627ebc19c4139b0a96a7c2351&language=en-US');

    if (response.statusCode == 200) {
      return movieTrailersFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD THE MOVIE Trailer');
    }
  }
}
