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
    this.lat,
    this.long,
    this.image,
  });

  String? city;
  String? country;
  double? lat;
  double? long;
  String? image;
  List<PopulationCountsModel>? populationCounts;

  CityModel copyWith({
    String? city,
    String? country,
    double? lat,
    double? long,
    List<PopulationCountsModel>? populationCounts,
  }) =>
      CityModel(
        city: city ?? this.city,
        country: country ?? this.country,
        populationCounts: populationCounts ?? this.populationCounts,
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        city: json["city"],
        country: json["country"],
        lat: json["lat"],
        long: json["long"],
        image: json["image"],
        populationCounts: json["populationCounts"] == null
            ? null
            : List<PopulationCountsModel>.from(json["populationCounts"]
                .map((x) => PopulationCountsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "lat": lat,
        "long": long,
        "image": image,
        "populationCounts": populationCounts == null
            ? null
            : List<dynamic>.from(populationCounts!.map((x) => x.toJson())),
      };
}
