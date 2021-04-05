import 'package:flutter/material.dart';
import 'package:movieapp2/models/movie.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  final int index;

  MovieDetailScreen({Key key, this.movie, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: new Container(
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1, top: 5),
                        child: GestureDetector(
                          child: Center(
                            child: Hero(
                              tag: 'imageHero$index',
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                height: 380,
                                width: 329,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1, top: 10),
                        child: Center(
                            child: Text(movie.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Release on " + movie.releaseDate.toString(),
                          style: new TextStyle(
                              color: Colors.white.withOpacity(.5)),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 2, bottom: 2),
                          child: Row(
                            children: movie.genreIds
                                .map((e) => Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(.4)),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: new Text(
                                          e.toString(),
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.5)),
                                        ),
                                      ),
                                    )))
                                .toList(),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Text("Movie Rating : ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.8),
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
                            ],
                          )),
                      Divider(
                        color: Colors.deepOrange,
                        height: 20,
                        thickness: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 8),
                        child: Text("Description",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, bottom: 3),
                        child: SingleChildScrollView(
                          child: Container(
                            child: SizedBox(
                              width: 300,
                              height: 160,
                              child: Text(
                                '${movie.overview}',
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                textAlign: TextAlign.left,
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
