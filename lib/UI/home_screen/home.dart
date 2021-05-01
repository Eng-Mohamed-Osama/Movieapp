import 'package:badges/badges.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/UI/actors_details/actor_details_screen.dart';
import 'package:movieapp2/UI/actors_list/actors_screen.dart';
import 'package:movieapp2/UI/home_screen/home_screen.dart';
import 'package:movieapp2/UI/movie_details/movie_details_screen.dart';
import 'package:movieapp2/UI/tvshows_details/tvshow_detailsWidget.dart';
import 'package:movieapp2/UI/tvshows_details/tvshow_details_screen.dart';
import 'package:movieapp2/UI/widgets/youtubevideo_player.dart';
import 'package:movieapp2/colors.dart';
import 'package:movieapp2/models/tvshow_details.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController(keepPage: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsCollection.mainColor,
        appBar: AppBar(
          shadowColor: ColorsCollection.secondaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notes_rounded,
                color: Colors.white,
                size: 25,
              ),
              Text('MovieLand',
                  style: TextStyle(
                      color: ColorsCollection.secondaryColor, fontSize: 22)),
              Badge(
                animationType: BadgeAnimationType.scale,
                shape: BadgeShape.circle,
                badgeColor: ColorsCollection.secondaryColor,
                child: Icon(
                  Icons.maps_ugc_rounded,
                  color: Colors.white,
                  size: 22,
                ),
                badgeContent: Text('0',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              // Icon(
              //   Icons.maps_ugc_rounded,
              //   color: ColorsCollection.secondaryColor,
              //   size: 25,
              // )
            ],
          ),
          backgroundColor: ColorsCollection.mainColor,
        ),
        body: Consumer<AppProvider>(builder: (buildContext, movieprovider, _) {
          return (movieprovider.movies != null &&
                  movieprovider.trending != null)
              ? SingleChildScrollView(
                  // controller: controller,
                  // dragStartBehavior: DragStartBehavior.down,
                  child: Column(children: <Widget>[
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 45,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //         left: 10.0, right: 20, top: 5),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Icon(
                    //           Icons.notes_rounded,
                    //           color: Colors.white,
                    //           size: 25,
                    //         ),
                    //         Badge(
                    //           animationType: BadgeAnimationType.scale,
                    //           shape: BadgeShape.circle,
                    //           badgeColor: ColorsCollection.secondaryColor,
                    //           child: Icon(
                    //             Icons.maps_ugc_rounded,
                    //             color: Colors.white,
                    //             size: 22,
                    //           ),
                    //           badgeContent: Text('0',
                    //               style: TextStyle(
                    //                   color: Colors.white, fontSize: 12)),
                    //         ),
                    //         // Icon(
                    //         //   Icons.maps_ugc_rounded,
                    //         //   color: ColorsCollection.secondaryColor,
                    //         //   size: 25,
                    //         // )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      color: ColorsCollection.mainColor,
                      height: 200.0,
                      child: PageIndicatorContainer(
                        key: key,
                        padding: EdgeInsets.all(5),
                        indicatorColor: Colors.white,
                        indicatorSelectorColor: ColorsCollection.secondaryColor,
                        shape: IndicatorShape.circle(size: 4),
                        child: PageView.builder(
                          itemCount: movieprovider.movies.take(6).length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: <Widget>[
                                Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500${movieprovider.movies[index].posterPath}'),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter)),
                                ),
                                GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            colors: [
                                          ColorsCollection.mainColor,
                                          ColorsCollection.mainColor
                                              .withOpacity(.4)
                                        ])),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailsScreen(
                                                  id: movieprovider
                                                      .movies[index].id,
                                                  // title: show.name,
                                                )));
                                  },
                                )
                              ],
                            );
                          },
                          controller: controller,
                          reverse: false,
                        ),
                        align: IndicatorAlign.bottom,
                        length: 6,
                        indicatorSpace: 10.0,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        height: 240,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Movies',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsCollection.secondaryColor),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          'See More',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: ColorsCollection
                                                  .secondaryColor),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeMovieTvshowscreen()));
                                        },
                                      ),
                                      Icon(
                                        Icons.arrow_right_rounded,
                                        size: 20,
                                        color: ColorsCollection.secondaryColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    (movieprovider.movies.length > 0) ? 17 : 0,
                                itemBuilder: (context, index) {
                                  final movie = movieprovider.movies[index];
                                  return GestureDetector(
                                    child: Container(
                                        width: 122,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: AspectRatio(
                                                aspectRatio: .7 / 1,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                          ),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6.0, left: 10),
                                              child: Text(
                                                movie.title,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailsScreen(
                                                    id: movie.id,
                                                    title: movie.title,
                                                  )));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 155,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 0, top: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Popular Actors',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsCollection.secondaryColor),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          'See More',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: ColorsCollection
                                                  .secondaryColor),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ActorsScreen()));
                                        },
                                      ),
                                      Icon(
                                        Icons.arrow_right_rounded,
                                        size: 20,
                                        color: ColorsCollection.secondaryColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 0,
                            // ),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    (movieprovider.actors.length > 0) ? 17 : 0,
                                itemBuilder: (context, index) {
                                  final actor = movieprovider.actors[index];
                                  return GestureDetector(
                                    child: Container(
                                        // height: 100,
                                        width: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: .7 / 1,
                                              child: Container(
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    actor.name,
                                                    maxLines: 2,
                                                    softWrap: true,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 8),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    // borderRadius:
                                                    //     BorderRadius.all(
                                                    //         Radius.circular(50)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                                                        ),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       top: 0, left: 10),
                                            //   child: Text(
                                            //     actor.name,
                                            //     maxLines: 2,
                                            //     softWrap: true,
                                            //     textAlign: TextAlign.center,
                                            //     style: TextStyle(
                                            //         color: Colors.white,
                                            //         fontSize: 11,
                                            //         fontWeight:
                                            //             FontWeight.normal),
                                            //   ),
                                            // )
                                          ],
                                        )),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ActorDetailScreen(
                                                    id: actor.id,
                                                  )));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 240,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'TV Shows',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsCollection.secondaryColor),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          'See More',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: ColorsCollection
                                                  .secondaryColor),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeMovieTvshowscreen()));
                                        },
                                      ),
                                      Icon(
                                        Icons.arrow_right_rounded,
                                        size: 20,
                                        color: ColorsCollection.secondaryColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    (movieprovider.shows.length > 0) ? 17 : 0,
                                itemBuilder: (context, index) {
                                  final show = movieprovider.shows[index];
                                  return GestureDetector(
                                    child: Container(
                                        width: 122,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: AspectRatio(
                                                aspectRatio: .7 / 1,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            'https://image.tmdb.org/t/p/w500${show.posterPath}',
                                                          ),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6.0, left: 10),
                                              child: Text(
                                                show.name,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )),
                                    onTap: () {
                                      print('run ${show.id}');
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TvshowDetailsScreen(
                                                    id: show.id,
                                                    title: show.originalName,
                                                    // showDetails: showDetails,
                                                    // showTrailers: showTrailer,
                                                    // movieCast: movieCast,
                                                  )));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Trending Today',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: ColorsCollection.secondaryColor),
                          ),
                          Icon(Icons.flash_on,
                              size: 24, color: ColorsCollection.secondaryColor)
                          // Row(
                          //   children: [
                          //     GestureDetector(
                          //       child: Text(
                          //         'See More',
                          //         style: TextStyle(
                          //             fontSize: 15,
                          //             fontWeight: FontWeight.bold,
                          //             color: ColorsCollection.secondaryColor),
                          //       ),
                          //       onTap: () {
                          //         Navigator.of(context).push(MaterialPageRoute(
                          //             builder: (context) => Homescreen()));
                          //       },
                          //     ),
                          //     Icon(
                          //       Icons.arrow_right_rounded,
                          //       size: 20,
                          //       color: ColorsCollection.secondaryColor,
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        itemCount: (movieprovider.trending.results.length > 0)
                            ? movieprovider.trending.results.length
                            : 0,
                        itemBuilder: (context, index) {
                          final trend = movieprovider.trending.results[index];
                          print(trend.mediaType.toString().toLowerCase());
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Container(
                                    height: 180,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     offset: Offset(1, 5),
                                        //     blurRadius: 3,
                                        //     spreadRadius: 1,
                                        //     color: Colors.white.withOpacity(.8),
                                        //   ),
                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500${trend.posterPath}'),
                                          fit: BoxFit.cover,
                                        )),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5)),
                                                color: ColorsCollection
                                                    .secondaryColor),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  left: 15,
                                                  right: 15),
                                              child: Text(
                                                '${trend.mediaType.toString().substring(10).toLowerCase()}',
                                                // (trend.mediaType.toString() ==
                                                //         'movie')
                                                //     ? 'TV show'
                                                //     : 'Movie',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ))),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            colors: [
                                          ColorsCollection.mainColor
                                              .withOpacity(.9),
                                          ColorsCollection.mainColor
                                              .withOpacity(.2)
                                        ])),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => (trend
                                                        .mediaType
                                                        .toString()
                                                        .substring(10)
                                                        .toLowerCase() ==
                                                    'movie')
                                                ? MovieDetailsScreen(
                                                    id: trend.id,
                                                    // title: show.name,
                                                  )
                                                : TvshowDetailsScreen(
                                                    id: trend.id,
                                                    // title: show.name,
                                                  )));
                                  },
                                ),
                                Positioned(
                                  bottom: 0,
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 25.0, left: 25),
                                    child: Text(
                                      (trend.title != null)
                                          ? '${trend.title}'
                                          : '${trend.originalName}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                )
              : Center(child: CircularProgressIndicator());
        }));
  }

  // Future<void> _refresh() {
  //   AppProvider provider = Provider.of<AppProvider>(context, listen: false);
  //   provider.getActors();
  //   return null;
  // }
}

// floatingActionButton: FloatingActionButton(
//   child: Icon(Icons.refresh),
//   tooltip: "force refresh indicator",
//   onPressed: () {
//     key.currentState?.forceRefreshState();
//   },
// ),
