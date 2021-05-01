// To parse this JSON data, do
//
//     final tvshowTrailer = tvshowTrailerFromJson(jsonString);

import 'dart:convert';

TvshowTrailer tvshowTrailerFromJson(String str) =>
    TvshowTrailer.fromJson(json.decode(str));

String tvshowTrailerToJson(TvshowTrailer data) => json.encode(data.toJson());

class TvshowTrailer {
  TvshowTrailer({
    this.id,
    this.results,
  });

  int id;
  List<Result> results;

  factory TvshowTrailer.fromJson(Map<String, dynamic> json) => TvshowTrailer(
        id: json["id"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
