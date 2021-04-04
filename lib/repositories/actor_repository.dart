import 'package:movieapp2/models/actorProfileImages.dart';
import 'package:movieapp2/models/actors.dart';
import 'package:movieapp2/models/actorImages.dart';
import 'package:movieapp2/services/actor_service.dart';

class ActorRepository {
  ActorService _actorService = ActorService();

  Future<List<Actor>> fetchActors(pageNumber) {
    return _actorService.fetchActors(pageNumber);
  }

  Future<ActorInfo> fetchActorImages(id) {
    return _actorService.fetchActorImages(id);
  }

  Future<ProfileImages> fetchActorProfileImages(id) {
    return _actorService.fetchActorProfileImages(id);
  }
}
