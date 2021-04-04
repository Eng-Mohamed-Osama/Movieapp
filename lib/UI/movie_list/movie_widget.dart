import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp2/UI/movie_details/movie_details_screen.dart';
import 'package:movieapp2/UI/movie_list/movie_list_provider.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieArray extends StatelessWidget {
  final Movie movie;
  final int index;

  const MovieArray({Key key, this.movie, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: new Container(
          child: Card(
            elevation: 25,
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Hero(
                    tag: 'imageHero$index',
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      height: 130,
                      width: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                              // index: movie.id,
                              id: movie.id,
                              // movies: movie,
                              title: movie.title,
                            )));
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2, top: 3),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(movie.title,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 17)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Icon(
                                        movie.fav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: movie.fav ? Colors.red : null,
                                        size: 24,
                                      ),
                                    ),
                                    onTap: () {
                                      if (movie.fav) {
                                        Fluttertoast.showToast(
                                            msg: "Removed from Favorite",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey[600]
                                                .withOpacity(.85),
                                            textColor: Colors.white,
                                            fontSize: 10.0);
                                      } else if (!movie.fav) {
                                        Fluttertoast.showToast(
                                            msg: "Added to Favorite",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey[600]
                                                .withOpacity(.85),
                                            textColor: Colors.white,
                                            fontSize: 10.0);
                                      }

                                      MoviesProvider provider =
                                          Provider.of<MoviesProvider>(context,
                                              listen: false);
                                      provider.addToFav(movie);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 1),
                            child: Text(
                              "Release on : " +
                                  DateFormat('yyy/MM/dd')
                                      .format(movie.releaseDate),
                              style: new TextStyle(
                                  color: Colors.black.withOpacity(.3)),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 1, bottom: 5),
                              child: Row(
                                children: [
                                  Text("Movie Rating : ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(.6))),
                                  SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 5,
                                      rating: (movie.voteAverage / 2),
                                      filledIconData: Icons.star_rate,
                                      halfFilledIconData: Icons.star_half,
                                      size: 15.0,
                                      isReadOnly: true,
                                      color: Colors.red[900],
                                      borderColor: Colors.black,
                                      spacing: 0.0),
                                ],
                              )),
                          SizedBox(
                            width: 250,
                            height: 55,
                            child: Text(
                              '${movie.overview}',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
