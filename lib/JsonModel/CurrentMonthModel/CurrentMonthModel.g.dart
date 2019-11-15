// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CurrentMonthModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentMonthModel _$CurrentMonthModelFromJson(Map<String, dynamic> json) {
  return CurrentMonthModel(json['sellerId'], json['total'], json['month']);
}

Map<String, dynamic> _$CurrentMonthModelToJson(CurrentMonthModel instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'total': instance.total,
      'month': instance.month
    };
