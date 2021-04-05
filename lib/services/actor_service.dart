import 'dart:convert';
import 'package:movieapp2/models/actorDetails.dart';
import 'package:movieapp2/models/actorProfileImages.dart';
import 'package:movieapp2/models/actors.dart';
import 'package:http/http.dart' as http;

class ActorService {
  Future<List<Actor>> fetchActors(pageNumber) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/person/popular?api_key=6847b68627ebc19c4139b0a96a7c2351&language=en-US&page=${pageNumber.toString()}');
    if (response.statusCode == 200) {
      return List<Actor>.from((json.decode(response.body)["results"] as List)
          .map((e) => Actor.fromJson((e)))).toList();
    } else {
      throw Exception('FAILED TO LOAD Actors');
    }
  }

  Future<ActorInfo> fetchActorDetails(int id) async {
    var response = await http.get(
        'https://api.themoviedb.org/3/person/$id?api_key=6847b68627ebc19c4139b0a96a7c2351&language=en-US');
    if (response.statusCode == 200) {
      return actorInfoFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD THE Images');
    }
  }

  Future<ProfileImages> fetchActorProfileImages(int id) async {
    var response = await http.get(
        'https://api.themoviedb.org/3/person/$id/images?api_key=6847b68627ebc19c4139b0a96a7c2351');
    if (response.statusCode == 200) {
      return profileImagesFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD THE Images');
    }
  }
}
