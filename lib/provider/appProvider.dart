import 'package:flutter/material.dart';
import 'package:movieapp2/models/movie_cast.dart';
import 'package:movieapp2/models/movie_details.dart';
import 'package:movieapp2/models/trending.dart';
import 'package:movieapp2/models/tvShow.dart';
import 'package:movieapp2/models/tvshow_details.dart';
import 'package:movieapp2/models/tvshow_trailer.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/models/actors.dart';
import 'package:movieapp2/repositories/actor_repository.dart';
import 'package:movieapp2/repositories/trending_repository.dart';
import 'package:movieapp2/repositories/tvShow_repository.dart';

class AppProvider extends ChangeNotifier {
  // MovieDtails movieDetails;
  // MovieTrailers movieTrailer;
  TvshowDetails tvShowDetails;
  TvshowTrailer tvShowTrailer;
  List<Movie> movies = [];
  List<TvShow> shows = [];
  static int favMovieCount = 0;
  static int startingPageActor = 1;
  static int startingPageTv = 1;
  String searchResult;
  List<Actor> actors = [];
  int startingPage = 1;
  int favPages = 0;
  int pageSize = 25;
  Trending trending;
  MovieDtails movieDetails;
//   MovieTrailers movieTrailer;
  MovieCast movieCast;

  ScrollController scrollController = new ScrollController();
  MovieRepository _movieRepository = MovieRepository();
  ActorRepository _actorRepository = ActorRepository();
  TrendingRepository _tredningRepository = TrendingRepository();
  // MovieRepository _movieRepository = MovieRepository();
  TvShowRepository _tvshowRepository = TvShowRepository();

  AppProvider({id}) {
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
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        startingPageActor++;
        getActors();
      }
    });
    if (startingPageActor == 1) {
      getActors();
    }
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        startingPageTv++;
        getTvshow();
      }
    });
    if (startingPageTv == 1) {
      getTvshow();
    }
    getTrending();
  }

  // void getMovieDetails(id) {
  //   _movieRepository.fetchMovieDetails(id).then((newMovieDetails) {
  //     movieDetails = newMovieDetails;
  //     _movieRepository.fetchMovieTrailers(id).then((newMovieTrailer) {
  //       movieTrailer = newMovieTrailer;
  //       notifyListeners();
  //     });
  //   });
  // }

  void getMovies() {
    _movieRepository.fetchMovies(startingPage).then((newMovie) {
      movies.addAll(newMovie);
      notifyListeners();
    });
  }

  void getTvshow() {
    _tvshowRepository.fetchTvshow(startingPageTv).then((newShow) {
      shows.addAll(newShow);
      notifyListeners();
    });
  }

  int get getCount => favMovieCount;

  void addToFav({Movie movie, TvShow show}) {
    if (movie != null) {
      movie.fav = !movie.fav;

      if (movie.fav) {
        favMovieCount++;
      } else {
        favMovieCount--;
      }
    }
    if (show != null) {
      show.fav = !show.fav;
      if (show.fav) {
        favMovieCount++;
      } else {
        favMovieCount--;
      }
    }

    notifyListeners();
  }

  void switchFavPages(index) {
    favPages = index;
    notifyListeners();
  }

  void searchingMovies(searchResults) {
    if (searchResults != null) {
      searchResult = searchResults;
    }
    notifyListeners();
  }

  void getActors() {
    _actorRepository.fetchActors(startingPage).then((newActor) {
      actors.addAll(newActor);
      notifyListeners();
    });
  }

  void getTrending() {
    _tredningRepository.fetchTrending().then((trend) {
      trending = trend;
      notifyListeners();
    });
  }
}
