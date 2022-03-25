import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.phone,
    required this.otp,
    required this.type,
  });

  String phone;
  int otp;
  String type;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        phone: json["phone"],
        otp: json["otp"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "otp": otp,
        "type": type,
      };
}
