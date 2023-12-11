// To parse this JSON data, do
//
//     final klinikModel = klinikModelFromJson(jsonString);

import 'dart:convert';

KlinikModel klinikModelFromJson(String str) => KlinikModel.fromJson(json.decode(str));

String klinikModelToJson(KlinikModel data) => json.encode(data.toJson());

class KlinikModel {
    String address;
    String imageUrl;
    String name;
    String openingHours;
    String phoneNumber;

    KlinikModel({
        required this.address,
        required this.imageUrl,
        required this.name,
        required this.openingHours,
        required this.phoneNumber,
    });

    factory KlinikModel.fromJson(Map<String, dynamic> json) => KlinikModel(
        address: json["address"],
        imageUrl: json["imageURL"],
        name: json["name"],
        openingHours: json["openingHours"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "imageURL": imageUrl,
        "name": name,
        "openingHours": openingHours,
        "phoneNumber": phoneNumber,
    };
}
