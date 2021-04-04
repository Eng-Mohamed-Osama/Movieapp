import 'package:movieapp2/UI/movie_list/movie_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/UI/movie_list/movie_widget.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Consumer<MoviesProvider>(
            builder: (buildContext, moviesProvider, _) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Search Movies'),
                backgroundColor: Colors.black,
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
