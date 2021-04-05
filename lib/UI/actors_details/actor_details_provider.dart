import 'package:flutter/material.dart';
import 'package:movieapp2/models/actorDetails.dart';
import 'package:movieapp2/models/actorProfileImages.dart';
import 'package:movieapp2/repositories/actor_repository.dart';

class ActorDetailsProvider extends ChangeNotifier {
  ActorInfo actorsInfo;
  ProfileImages actorProfileImages;

  ActorRepository _actorRepository = ActorRepository();

  ActorDetailsProvider(id) {
    getMovieDetails(id);
  }

  void getMovieDetails(id) {
    _actorRepository.fetchActorDetails(id).then((newActors) {
      actorsInfo = newActors;
      _actorRepository.fetchActorProfileImages(id).then((newActorImages) {
        actorProfileImages = newActorImages;
        print('from actor details provider');
        notifyListeners();
      });
    });
  }

  void getActorImages(id) {}
}
