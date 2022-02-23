// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.query,
    required this.language,
    required this.preferedReferential,
    required this.bestMatch,
    required this.results,
    required this.version,
  });

  Query query;
  String language;
  String preferedReferential;
  String bestMatch;
  List<Result> results;
  String version;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        query: Query.fromJson(json["query"]),
        language: json["language"],
        preferedReferential: json["preferedReferential"],
        bestMatch: json["bestMatch"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "query": query.toJson(),
        "language": language,
        "preferedReferential": preferedReferential,
        "bestMatch": bestMatch,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "version": version,
      };
}

class Query {
  Query({
    required this.project,
    required this.images,
    required this.organs,
    required this.includeRelatedImages,
  });

  String project;
  List<String> images;
  List<String> organs;
  bool includeRelatedImages;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        project: json["project"],
        images: List<String>.from(json["images"].map((x) => x)),
        organs: List<String>.from(json["organs"].map((x) => x)),
        includeRelatedImages: json["includeRelatedImages"],
      );

  Map<String, dynamic> toJson() => {
        "project": project,
        "images": List<dynamic>.from(images.map((x) => x)),
        "organs": List<dynamic>.from(organs.map((x) => x)),
        "includeRelatedImages": includeRelatedImages,
      };
}

class Result {
  Result({
    required this.score,
    required this.species,
    required this.gbif,
  });

  double score;
  Species species;
  Gbif gbif;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        score: json["score"].toDouble(),
        species: Species.fromJson(json["species"]),
        gbif: Gbif.fromJson(json["gbif"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "species": species.toJson(),
        "gbif": gbif.toJson(),
      };
}

class Gbif {
  Gbif({
    required this.id,
  });

  String id;

  factory Gbif.fromJson(Map<String, dynamic> json) => Gbif(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Species {
  Species({
    required this.scientificNameWithoutAuthor,
    required this.scientificNameAuthorship,
    required this.genus,
    required this.family,
    required this.commonNames,
    required this.scientificName,
  });

  String scientificNameWithoutAuthor;
  String scientificNameAuthorship;
  Family genus;
  Family family;
  List<String> commonNames;
  String scientificName;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        scientificNameWithoutAuthor: json["scientificNameWithoutAuthor"],
        scientificNameAuthorship: json["scientificNameAuthorship"],
        genus: Family.fromJson(json["genus"]),
        family: Family.fromJson(json["family"]),
        commonNames: List<String>.from(json["commonNames"].map((x) => x)),
        scientificName: json["scientificName"],
      );

  Map<String, dynamic> toJson() => {
        "scientificNameWithoutAuthor": scientificNameWithoutAuthor,
        "scientificNameAuthorship": scientificNameAuthorship,
        "genus": genus.toJson(),
        "family": family.toJson(),
        "commonNames": List<dynamic>.from(commonNames.map((x) => x)),
        "scientificName": scientificName,
      };
}

class Family {
  Family({
    required this.scientificNameWithoutAuthor,
    required this.scientificNameAuthorship,
    required this.scientificName,
  });

  String scientificNameWithoutAuthor;
  String scientificNameAuthorship;
  String scientificName;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        scientificNameWithoutAuthor: json["scientificNameWithoutAuthor"],
        scientificNameAuthorship: json["scientificNameAuthorship"],
        scientificName: json["scientificName"],
      );

  Map<String, dynamic> toJson() => {
        "scientificNameWithoutAuthor": scientificNameWithoutAuthor,
        "scientificNameAuthorship": scientificNameAuthorship,
        "scientificName": scientificName,
      };
}
