// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

import 'package:text_case_4123123/models/response/populations_count_model.dart';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.city,
    this.country,
    this.populationCounts,
  });

  String? city;
  String? country;
  List<PopulationCountsModel>? populationCounts;

  CityModel copyWith({
    String? city,
    String? country,
    List<PopulationCountsModel>? populationCounts,
  }) =>
      CityModel(
        city: city ?? this.city,
        country: country ?? this.country,
        populationCounts: populationCounts ?? this.populationCounts,
      );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        city: json["city"],
        country: json["country"],
        populationCounts: json["populationCounts"] == null
            ? null
            : List<PopulationCountsModel>.from(json["populationCounts"]
                .map((x) => PopulationCountsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "populationCounts": populationCounts == null
            ? null
            : List<dynamic>.from(populationCounts!.map((x) => x.toJson())),
      };
}
