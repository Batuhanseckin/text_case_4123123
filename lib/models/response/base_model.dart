// To parse this JSON data, do
//
//     final baseModel = baseModelFromJson(jsonString);

import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  BaseModel({
    this.error,
    this.msg,
    this.data,
  });

  bool? error;
  String? msg;
  dynamic data;

  BaseModel copyWith({
    bool? error,
    String? msg,
    dynamic data,
  }) =>
      BaseModel(
        error: error ?? this.error,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        error: json["error"],
        msg: json["msg"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data,
      };
}
