import 'package:flutter/material.dart';
import 'package:movieapp2/models/actors.dart';
import 'package:movieapp2/repositories/actor_repository.dart';

class ActorProvider extends ChangeNotifier {
  List<Actor> actors = [];
  int startingPage = 1;
  int pageSize = 25;
  ScrollController scrollController = new ScrollController();

  ActorRepository _actorRepository = ActorRepository();
  ActorProvider() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        startingPage++;
        getActors();
      }
    });
    if (startingPage == 1) {
      getActors();
    }
  }

  void getActors() {
    _actorRepository.fetchActors(startingPage).then((newActor) {
      actors.addAll(newActor);
      notifyListeners();
    });
  }
}
