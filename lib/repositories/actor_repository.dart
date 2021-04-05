import 'package:movieapp2/models/actorProfileImages.dart';
import 'package:movieapp2/models/actors.dart';
import 'package:movieapp2/models/actorDetails.dart';
import 'package:movieapp2/services/actor_service.dart';

class ActorRepository {
  ActorService _actorService = ActorService();

  Future<List<Actor>> fetchActors(pageNumber) {
    return _actorService.fetchActors(pageNumber);
  }

  Future<ActorInfo> fetchActorDetails(id) {
    return _actorService.fetchActorDetails(id);
  }

  Future<ProfileImages> fetchActorProfileImages(id) {
    return _actorService.fetchActorProfileImages(id);
  }
}
