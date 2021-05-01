// To parse this JSON data, do
//
//     final trending = trendingFromJson(jsonString);

import 'dart:convert';

Trending trendingFromJson(String str) => Trending.fromJson(json.decode(str));

String trendingToJson(Trending data) => json.encode(data.toJson());

class Trending {
  Trending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.posterPath,
    this.video,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.id,
    this.adult,
    this.backdropPath,
    this.title,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.mediaType,
    this.firstAirDate,
    this.originalName,
    this.name,
    this.originCountry,
  });

  String posterPath;
  bool video;
  double voteAverage;
  String overview;
  DateTime releaseDate;
  int id;
  bool adult;
  String backdropPath;
  String title;
  List<int> genreIds;
  int voteCount;
  OriginalLanguage originalLanguage;
  String originalTitle;
  double popularity;
  MediaType mediaType;
  DateTime firstAirDate;
  String originalName;
  String name;
  List<String> originCountry;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        posterPath: json["poster_path"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        id: json["id"],
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"],
        title: json["title"] == null ? null : json["title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        voteCount: json["vote_count"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        popularity: json["popularity"].toDouble(),
        mediaType: mediaTypeValues.map[json["media_type"]],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "id": id,
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath,
        "title": title == null ? null : title,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "vote_count": voteCount,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "popularity": popularity,
        "media_type": mediaTypeValues.reverse[mediaType],
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "original_name": originalName == null ? null : originalName,
        "name": name == null ? null : name,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((x) => x)),
      };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, JA, TR, PL }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "pl": OriginalLanguage.PL,
  "tr": OriginalLanguage.TR
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
