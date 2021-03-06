import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp2/UI/movie_details/movie_details_screen.dart';
import 'package:movieapp2/colors.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieArray extends StatelessWidget {
  final Movie movie;
  final int index;

  const MovieArray({
    Key key,
    this.movie,
    this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: new Container(
          child: Card(
            elevation: 5,
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
                        width: 80,
                        // height: 150,
                        fit: BoxFit.cover),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                            id: movie.id,
                            title: movie.title,
                            moviefav: movie)));
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
                                          fontSize: 15)),
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
                                        color: movie.fav
                                            ? ColorsCollection.secondaryColor
                                            : null,
                                        size: 22,
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
                                            fontSize: 12.0);
                                      } else if (!movie.fav) {
                                        Fluttertoast.showToast(
                                            msg: "Added to Favorite",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey[600]
                                                .withOpacity(.85),
                                            textColor: Colors.white,
                                            fontSize: 12.0);
                                      }
                                      AppProvider provider =
                                          Provider.of<AppProvider>(context,
                                              listen: false);
                                      provider.addToFav(movie: movie);
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
                                      color: ColorsCollection.secondaryColor,
                                      borderColor: Colors.black,
                                      spacing: 0.0),
                                ],
                              )),
                          SizedBox(
                            width: 250,
                            // height: 45,
                            child: Text(
                              '${movie.overview}',
                              overflow: TextOverflow.fade,
                              maxLines: 3,
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
