import 'package:json_annotation/json_annotation.dart';

part 'ShopInfoModel.g.dart';

@JsonSerializable()
class ShopInfoModel {
  List<Shop> shop;

  ShopInfoModel(this.shop);

  factory ShopInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ShopInfoModelFromJson(json);
}

@JsonSerializable()
class Shop {
  var id;
  var userId;
  var name;
  var lat;
  var lng;

  Shop(this.id, this.userId, this.name, this.lat, this.lng);

  factory Shop.fromJson(Map<String, dynamic> json) =>
      _$ShopFromJson(json);
}
