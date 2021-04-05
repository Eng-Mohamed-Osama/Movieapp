import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp2/UI/widgets/youtubevideo_player.dart';
import 'package:movieapp2/models/movie_details.dart';
import 'package:movieapp2/models/movie_trailer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDtails movie;
  final int index;
  final MovieTrailers movieTrailers;

  MovieDetailsWidget({Key key, this.movie, this.index, this.movieTrailers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(movieTrailers.results[0].key);
    print(movie.id);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Hero(
                              tag: 'imageHero$index',
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                height: 450,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * .45),
                        height: 600,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 5, top: 25, left: 5),
                                child: Text(movie.title,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        fontSize: 25)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, left: 5),
                                child: Text(
                                  "Release on : " +
                                      DateFormat('yyy/MM/dd')
                                          .format(movie.releaseDate),
                                  style: new TextStyle(
                                      color: Colors.white.withOpacity(.5)),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Wrap(
                                  runSpacing: 5,
                                  spacing: 5,
                                  direction: Axis.horizontal,
                                  children: movie.genres
                                      .map(
                                        (e) => Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white
                                                          .withOpacity(.4)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: new Text(
                                                  e.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(.5)),
                                                ),
                                              ),
                                            )),
                                      )
                                      .toList(),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                  child: Row(
                                    children: [
                                      Text("Movie Rating : ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.white.withOpacity(.8),
                                              fontSize: 15)),
                                      SmoothStarRating(
                                          allowHalfRating: false,
                                          starCount: 5,
                                          rating: (movie.voteAverage / 2),
                                          size: 18.0,
                                          isReadOnly: true,
                                          color: Colors.red[900],
                                          borderColor: Colors.white,
                                          spacing: 0.0),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
                                        child: Text(
                                            "Language :  ${movie.originalLanguage.toUpperCase()}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                                    .withOpacity(.8),
                                                fontSize: 15)),
                                      ),
                                    ],
                                  )),
                              Divider(
                                color: Colors.white,
                                height: 20,
                                thickness: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 8, left: 5),
                                child: Text("Description :",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      '${movie.overview}',
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 10, left: 5),
                                child: Text("Trailer :",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: YoutubePlayerwidge(
                                      youtubeLink:
                                          movieTrailers.results[0].key))
                            ]),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(15, 5),
                                blurRadius: 35,
                                spreadRadius: 10,
                                color: Colors.black.withOpacity(.8),
                              ),
                            ],
                            color: Color(0xFF151C26),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
