// To parse this JSON data, do
//
//     final populationCountsModel = populationCountsModelFromJson(jsonString);

import 'dart:convert';

PopulationCountsModel populationCountsModelFromJson(String str) =>
    PopulationCountsModel.fromJson(json.decode(str));

String populationCountsModelToJson(PopulationCountsModel data) =>
    json.encode(data.toJson());

class PopulationCountsModel {
  PopulationCountsModel({
    this.year,
    this.value,
    this.sex,
    this.reliabilty,
  });

  int? year;
  double? value;
  String? sex;
  String? reliabilty;

  PopulationCountsModel copyWith({
    int? year,
    double? value,
    String? sex,
    String? reliabilty,
  }) =>
      PopulationCountsModel(
        year: year ?? this.year,
        value: value ?? this.value,
        sex: sex ?? this.sex,
        reliabilty: reliabilty ?? this.reliabilty,
      );

  factory PopulationCountsModel.fromJson(Map<String, dynamic> json) =>
      PopulationCountsModel(
        year: json["year"],
        value: json["value"].toDouble(),
        sex: json["sex"],
        reliabilty: json["reliabilty"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "value": value,
        "sex": sex,
        "reliabilty": reliabilty,
      };
}
