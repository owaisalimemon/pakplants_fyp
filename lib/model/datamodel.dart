// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.plantNameInModel,
    required this.plantScientificName,
    required this.plantCommonName,
    required this.plantInformation,
    required this.plantPros,
    required this.plantCons,
  });

  String plantNameInModel;
  String plantScientificName;
  String plantCommonName;
  String plantInformation;
  String plantPros;
  String plantCons;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        plantNameInModel: json["Plant_name_in_model"],
        plantScientificName: json["Plant_scientific_name"],
        plantCommonName: json["Plant_common_name"],
        plantInformation: json["Plant_Information"],
        plantPros: json["Plant_pros"],
        plantCons: json["Plant_cons"],
      );

  Map<String, dynamic> toJson() => {
        "Plant_name_in_model": plantNameInModel,
        "Plant_scientific_name": plantScientificName,
        "Plant_common_name": plantCommonName,
        "Plant_Information": plantInformation,
        "Plant_pros": plantPros,
        "Plant_cons": plantCons,
      };
}
