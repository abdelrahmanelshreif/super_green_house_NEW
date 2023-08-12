import 'Data.dart';
import 'dart:convert';

PlantModel plantModelFromJson(String str) => PlantModel.fromJson(json.decode(str));
String plantModelToJson(PlantModel data) => json.encode(data.toJson());
class PlantModel {
  PlantModel({
      this.status, 
      this.message, 
      this.data,});

  PlantModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  dynamic message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}