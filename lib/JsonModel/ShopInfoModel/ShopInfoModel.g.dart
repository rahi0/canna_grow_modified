// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShopInfoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopInfoModel _$ShopInfoModelFromJson(Map<String, dynamic> json) {
  return ShopInfoModel((json['shop'] as List)
      ?.map((e) => e == null ? null : Shop.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ShopInfoModelToJson(ShopInfoModel instance) =>
    <String, dynamic>{'shop': instance.shop};

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
      json['id'], json['userId'], json['name'], json['lat'], json['lng']);
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng
    };
