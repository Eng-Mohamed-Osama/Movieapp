import 'package:flutter/material.dart';
import 'package:movieapp2/models/actors.dart';

class Actors extends StatelessWidget {
  final Actor actor;
  final int index;

  const Actors({Key key, this.actor, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.antiAlias,
        child: new Container(
          height: 150,
          width: 100,
          child: GestureDetector(
            child: Hero(
              tag: 'imageHero$index',
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
