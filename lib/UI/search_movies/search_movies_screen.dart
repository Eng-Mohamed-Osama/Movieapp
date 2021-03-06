import 'package:movieapp2/UI/favourit_movies/movie_nofavouritFound_widget.dart';
import 'package:movieapp2/UI/movie_list/movie_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp2/UI/movie_list/movie_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  bool emptysearch = true;
  SearchScreen({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 1,
        child: Consumer<MoviesProvider>(
            builder: (buildContext, moviesProvider, _) {
          List searchResultList = moviesProvider.movies
              .where((m) => m.title.toLowerCase().contains(
                  moviesProvider.searchResult.toString().toLowerCase()))
              .toList();
          return Scaffold(
              appBar: AppBar(
                title: Text('Search Movies'),
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Center(
                      child: Container(
                          width: 300,
                          clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.only(left: 16),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Search for your favourit Movie',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(.6),
                                  fontSize: 12,
                                ),
                                border: InputBorder.none),
                            onChanged: (text) {
                              if (text.length > 0) {
                                text = text.toLowerCase();
                                moviesProvider.searchingMovies(text);
                                emptysearch = false;
                              } else if (text.isEmpty) {
                                moviesProvider.searchingMovies('null');
                                emptysearch = true;
                              }
                            },
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFF151C26))),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(top: size.height * .05),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Color(0xFF151C26),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 20,
                            spreadRadius: 10,
                            color: Color(0xFF151C26),
                          ),
                        ],
                      ),
                      height: size.height * .712,
                      child: SizedBox(
                        child: (searchResultList.length > 0 &&
                                emptysearch == false)
                            ? ListView.builder(
                                itemCount: searchResultList.length,
                                itemBuilder: (ctx, index) {
                                  final movie = searchResultList[index];
                                  final movieindex = index;
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: MovieArray(
                                      movie: movie,
                                      index: movieindex,
                                    ),
                                  );
                                })
                            : NoFileScreen(),
                      ),
                    )),
                  )
                ],
              ));
        }));
  }
}
