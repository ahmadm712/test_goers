// To parse this JSON data, do
//
//     final starwarsSpeciesResponseModel = starwarsSpeciesResponseModelFromJson(jsonString);

import 'dart:convert';

StarwarsSpeciesResponseModel starwarsSpeciesResponseModelFromJson(String str) =>
    StarwarsSpeciesResponseModel.fromJson(json.decode(str));

String starwarsSpeciesResponseModelToJson(StarwarsSpeciesResponseModel data) =>
    json.encode(data.toJson());

class StarwarsSpeciesResponseModel {
  StarwarsSpeciesResponseModel({
    this.count,
    this.next,
    this.previous,
    this.species,
  });

  int? count;
  String? next;
  String? previous;
  List<Species>? species;

  factory StarwarsSpeciesResponseModel.fromJson(Map<String, dynamic> json) =>
      StarwarsSpeciesResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        species:
            List<Species>.from(json["results"].map((x) => Species.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(species!.map((x) => x.toJson())),
      };
}

class Species {
  Species({
    this.name,
    this.classification,
    this.designation,
    this.averageHeight,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
    this.averageLifespan,
    this.homeworld,
    this.language,
    this.people,
    this.films,
    this.created,
    this.edited,
    this.url,
  });

  String? name;
  String? classification;
  String? designation;
  String? averageHeight;
  String? skinColors;
  String? hairColors;
  String? eyeColors;
  String? averageLifespan;
  String? homeworld;
  String? language;
  List<String>? people;
  List<String>? films;
  DateTime? created;
  DateTime? edited;
  String? url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        classification: json["classification"],
        designation: json["designation"],
        averageHeight: json["average_height"],
        skinColors: json["skin_colors"],
        hairColors: json["hair_colors"],
        eyeColors: json["eye_colors"],
        averageLifespan: json["average_lifespan"],
        homeworld: json["homeworld"] ?? "",
        language: json["language"],
        people: List<String>.from(json["people"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "classification": classification,
        "designation": designation,
        "average_height": averageHeight,
        "skin_colors": skinColors,
        "hair_colors": hairColors,
        "eye_colors": eyeColors,
        "average_lifespan": averageLifespan,
        "homeworld": homeworld,
        "language": language,
        "people": List<dynamic>.from(people!.map((x) => x)),
        "films": List<dynamic>.from(films!.map((x) => x)),
        "created": created!.toIso8601String(),
        "edited": edited!.toIso8601String(),
        "url": url,
      };
}
