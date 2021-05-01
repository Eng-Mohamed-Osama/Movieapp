// // To parse this JSON data, do
// //
// //     final news = newsFromJson(jsonString);

// import 'dart:convert';

// List<News> newsFromJson(String str) =>
//     List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

// String newsToJson(List<News> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class News {
//   News({
//     this.author,
//     this.category,
//     this.country,
//     this.description,
//     this.image,
//     this.language,
//     this.publishedAt,
//     this.source,
//     this.title,
//     this.url,
//   });

//   Author author;
//   Category category;
//   Country country;
//   String description;
//   String image;
//   Language language;
//   DateTime publishedAt;
//   Source source;
//   String title;
//   String url;

//   factory News.fromJson(Map<String, dynamic> json) => News(
//         author:
//             json["author"] == null ? null : authorValues.map[json["author"]],
//         category: categoryValues.map[json["category"]],
//         country: countryValues.map[json["country"]],
//         description: json["description"],
//         image: json["image"],
//         language: languageValues.map[json["language"]],
//         publishedAt: DateTime.parse(json["published_at"]),
//         source: sourceValues.map[json["source"]],
//         title: json["title"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "author": author == null ? null : authorValues.reverse[author],
//         "category": categoryValues.reverse[category],
//         "country": countryValues.reverse[country],
//         "description": description,
//         "image": image,
//         "language": languageValues.reverse[language],
//         "published_at": publishedAt.toIso8601String(),
//         "source": sourceValues.reverse[source],
//         "title": title,
//         "url": url,
//       };
// }

// enum Author {
//   JANINE_PUHAK,
//   JESSICA_NAPOLI,
//   MICHAEL_BARTIROMO,
//   STEPHANIE_NOLASCO,
//   JOSEPH_WULFSOHN,
//   CORTNEY_MOORE,
//   MELISSA_ROBERTO,
//   ANN_SCHMIDT,
//   GARY_GASTELU,
//   MICHAEL_HOLLAN,
//   TYLER_MC_CARTHY,
//   NATE_DAY,
//   JAMES_LEGGATE,
//   DOM_CALICCHIO,
//   ANDY_SAHADEO,
//   JULIUS_YOUNG,
//   BRIE_STIMSON,
//   JEANETTE_SETTEMBRE
// }

// final authorValues = EnumValues({
//   "Andy Sahadeo": Author.ANDY_SAHADEO,
//   "Ann Schmidt": Author.ANN_SCHMIDT,
//   "Brie Stimson": Author.BRIE_STIMSON,
//   "Cortney Moore": Author.CORTNEY_MOORE,
//   "Dom Calicchio": Author.DOM_CALICCHIO,
//   "Gary Gastelu": Author.GARY_GASTELU,
//   "James Leggate": Author.JAMES_LEGGATE,
//   "Janine Puhak": Author.JANINE_PUHAK,
//   "Jeanette Settembre": Author.JEANETTE_SETTEMBRE,
//   "Jessica Napoli": Author.JESSICA_NAPOLI,
//   "Joseph Wulfsohn": Author.JOSEPH_WULFSOHN,
//   "Julius Young": Author.JULIUS_YOUNG,
//   "Melissa Roberto": Author.MELISSA_ROBERTO,
//   "Michael Bartiromo": Author.MICHAEL_BARTIROMO,
//   "Michael Hollan": Author.MICHAEL_HOLLAN,
//   "Nate Day": Author.NATE_DAY,
//   "Stephanie Nolasco": Author.STEPHANIE_NOLASCO,
//   "Tyler McCarthy": Author.TYLER_MC_CARTHY
// });

// enum Category { ENTERTAINMENT }

// final categoryValues = EnumValues({"entertainment": Category.ENTERTAINMENT});

// enum Country { US }

// final countryValues = EnumValues({"us": Country.US});

// enum Language { EN }

// final languageValues = EnumValues({"en": Language.EN});

// enum Source { FOX_NEWS_LIFESTYLE, FOX_NEWS_ENTERTAINMENT }

// final sourceValues = EnumValues({
//   "FOX News - Entertainment": Source.FOX_NEWS_ENTERTAINMENT,
//   "FOX News - Lifestyle": Source.FOX_NEWS_LIFESTYLE
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
