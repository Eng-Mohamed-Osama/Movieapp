import 'dart:convert';

ProfileImages profileImagesFromJson(String str) =>
    ProfileImages.fromJson(json.decode(str));

String profileImagesToJson(ProfileImages data) => json.encode(data.toJson());

class ProfileImages {
  ProfileImages({
    this.id,
    this.profiles,
  });

  int id;
  List<ProfileImage> profiles;

  factory ProfileImages.fromJson(Map<String, dynamic> json) => ProfileImages(
        id: json["id"],
        profiles: List<ProfileImage>.from(
            json["profiles"].map((x) => ProfileImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
      };
}

class ProfileImage {
  ProfileImage({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  double aspectRatio;
  String filePath;
  int height;
  dynamic iso6391;
  double voteAverage;
  int voteCount;
  int width;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        aspectRatio: json["aspect_ratio"].toDouble(),
        filePath: json["file_path"],
        height: json["height"],
        iso6391: json["iso_639_1"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "file_path": filePath,
        "height": height,
        "iso_639_1": iso6391,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
