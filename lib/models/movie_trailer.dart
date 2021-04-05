// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// MovieTrailer movieTrailerFromJson(String str) =>
//     MovieTrailer.fromJson(json.decode(str));

// class MovieTrailer {
//   MovieTrailer({
//     this.id,
//     this.iso6391,
//     this.iso31661,
//     this.key,
//     this.name,
//     this.site,
//     this.size,
//     this.type,
//   });

//   int id;
//   String iso6391;
//   String iso31661;
//   String key;
//   String name;
//   String site;
//   int size;
//   String type;

//   factory MovieTrailer.fromJson(Map<String, dynamic> json) => MovieTrailer(
//         id: json["id"],
//         iso6391: json["iso_639_1"],
//         iso31661: json["iso_3166_1"],
//         key: json["key"],
//         name: json["name"],
//         site: json["site"],
//         size: json["size"],
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "iso_639_1": iso6391,
//         "iso_3166_1": iso31661,
//         "key": key,
//         "name": name,
//         "site": site,
//         "size": size,
//         "type": type,
//       };
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MovieTrailers movieTrailersFromJson(String str) =>
    MovieTrailers.fromJson(json.decode(str));

// String movieTrailersToJson(MovieTrailers data) => json.encode(data.toJson());

class MovieTrailers {
  MovieTrailers({
    this.id,
    this.results,
  });

  int id;
  List<MovieTrailer> results;

  factory MovieTrailers.fromJson(Map<String, dynamic> json) => MovieTrailers(
        id: json["id"],
        results: List<MovieTrailer>.from(
            json["results"].map((x) => MovieTrailer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class MovieTrailer {
  MovieTrailer({
    this.id,
    this.iso6391,
    this.iso31661,
    this.key,
    this.name,
    this.site,
    this.size,
    this.type,
  });

  String id;
  String iso6391;
  String iso31661;
  String key;
  String name;
  String site;
  int size;
  String type;

  factory MovieTrailer.fromJson(Map<String, dynamic> json) => MovieTrailer(
        id: json["id"],
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        key: json["key"],
        name: json["name"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "key": key,
        "name": name,
        "site": site,
        "size": size,
        "type": type,
      };
}
