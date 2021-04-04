import 'package:movieapp2/UI/movie_list/movie_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/UI/widgets/movie_widget.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Consumer<MoviesProvider>(
            builder: (buildContext, moviesProvider, _) {
          var row = Row(
            children: [
              Text('MovieLand'),
              Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    child: Badge(
                      animationType: BadgeAnimationType.scale,
                      shape: BadgeShape.circle,
                      badgeColor: Colors.red,
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                      ),
                      badgeContent: Text(
                          '${MoviesProvider.favMovieCount.toString()}',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ))
            ],
          );
          return Scaffold(
              appBar: AppBar(
                title: row,
                backgroundColor: Colors.black,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: 'Movies',
                    ),
                    Tab(
                      text: 'TV Shows',
                    )
                  ],
                ),
              ),
              body: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.blue[300]),
                            border: InputBorder.none),
                        onChanged: (text) {
                          text = text.toLowerCase();
                          print('from search');
                          var leength = moviesProvider.movies.where((m) => m
                              .title
                              .toLowerCase()
                              .contains(moviesProvider.searchResult
                                  .toString()
                                  .toLowerCase()));

                          moviesProvider.searchingMovies(text);
                          print(
                              'FromProvider : ${moviesProvider.searchResult}');
                          print('Movies : $leength');

                          // movies.where((el) => el.title == text)
                        },
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                        child: SizedBox(
                      height: 550,
                      child: (moviesProvider.movies.where((m) => m.title
                                  .toLowerCase()
                                  .contains(moviesProvider.searchResult
                                      .toString()
                                      .toLowerCase())) !=
                              null)
                          ? ListView.builder(
                              itemCount: moviesProvider.movies
                                  .where((m) => m.title.toLowerCase().contains(
                                      moviesProvider.searchResult
                                          .toString()
                                          .toLowerCase()))
                                  .toList()
                                  .length,
                              itemBuilder: (ctx, index) {
                                final movie = moviesProvider.movies
                                    .where((m) => m.title
                                        .toLowerCase()
                                        .contains(moviesProvider.searchResult
                                            .toString()
                                            .toLowerCase()))
                                    .toList()[index];
                                final movieindex = index;
                                return MovieArray(
                                  movie: movie,
                                  index: movieindex,
                                );
                              })
                          : Center(child: CircularProgressIndicator()),
                    )),
                  )
                ],
              ));
        }));
  }
}
