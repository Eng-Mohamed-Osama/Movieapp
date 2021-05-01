// To parse this JSON data, do
//
//     final tvshowSeasion = tvshowSeasionFromJson(jsonString);

import 'dart:convert';

TvshowSeasion tvshowSeasionFromJson(String str) =>
    TvshowSeasion.fromJson(json.decode(str));

String tvshowSeasionToJson(TvshowSeasion data) => json.encode(data.toJson());

class TvshowSeasion {
  TvshowSeasion({
    this.id,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.tvshowSeasionId,
    this.posterPath,
    this.seasonNumber,
  });

  String id;
  DateTime airDate;
  List<Episode> episodes;
  String name;
  String overview;
  int tvshowSeasionId;
  String posterPath;
  int seasonNumber;

  factory TvshowSeasion.fromJson(Map<String, dynamic> json) => TvshowSeasion(
        id: json["_id"],
        airDate: DateTime.parse(json["air_date"]),
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
        name: json["name"],
        overview: json["overview"],
        tvshowSeasionId: json["id"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "air_date":
            "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
        "name": name,
        "overview": overview,
        "id": tvshowSeasionId,
        "poster_path": posterPath,
        "season_number": seasonNumber,
      };
}

class Episode {
  Episode({
    this.airDate,
    this.episodeNumber,
    this.crew,
    this.guestStars,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  DateTime airDate;
  int episodeNumber;
  List<Crew> crew;
  List<Crew> guestStars;
  int id;
  String name;
  String overview;
  String productionCode;
  int seasonNumber;
  String stillPath;
  double voteAverage;
  int voteCount;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        airDate: DateTime.parse(json["air_date"]),
        episodeNumber: json["episode_number"],
        crew: List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x))),
        guestStars:
            List<Crew>.from(json["guest_stars"].map((x) => Crew.fromJson(x))),
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        productionCode: json["production_code"],
        seasonNumber: json["season_number"],
        stillPath: json["still_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "air_date":
            "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episode_number": episodeNumber,
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
        "guest_stars": List<dynamic>.from(guestStars.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "overview": overview,
        "production_code": productionCode,
        "season_number": seasonNumber,
        "still_path": stillPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Crew {
  Crew({
    this.department,
    this.job,
    this.creditId,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.order,
    this.character,
  });

  Department department;
  Job job;
  String creditId;
  bool adult;
  int gender;
  int id;
  Department knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int order;
  String character;

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        department: json["department"] == null
            ? null
            : departmentValues.map[json["department"]],
        job: json["job"] == null ? null : jobValues.map[json["job"]],
        creditId: json["credit_id"],
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: departmentValues.map[json["known_for_department"]],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        order: json["order"] == null ? null : json["order"],
        character: json["character"] == null ? null : json["character"],
      );

  Map<String, dynamic> toJson() => {
        "department":
            department == null ? null : departmentValues.reverse[department],
        "job": job == null ? null : jobValues.reverse[job],
        "credit_id": creditId,
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": departmentValues.reverse[knownForDepartment],
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "order": order == null ? null : order,
        "character": character == null ? null : character,
      };
}

enum Department {
  DIRECTING,
  CAMERA,
  EDITING,
  WRITING,
  CREATOR,
  ACTING,
  PRODUCTION
}

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Camera": Department.CAMERA,
  "Creator": Department.CREATOR,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Production": Department.PRODUCTION,
  "Writing": Department.WRITING
});

enum Job { DIRECTOR, DIRECTOR_OF_PHOTOGRAPHY, EDITOR, WRITER }

final jobValues = EnumValues({
  "Director": Job.DIRECTOR,
  "Director of Photography": Job.DIRECTOR_OF_PHOTOGRAPHY,
  "Editor": Job.EDITOR,
  "Writer": Job.WRITER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
