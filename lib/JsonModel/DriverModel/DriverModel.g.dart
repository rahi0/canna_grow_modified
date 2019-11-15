// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DriverModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) {
  return DriverModel((json['driver'] as List)
      ?.map(
          (e) => e == null ? null : Driver.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{'driver': instance.driver};

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
      json['id'],
      json['userId'],
      json['carBrand'],
      json['carColor'],
      json['carModel'],
      json['carPlateNumber'],
      json['license'],
      json['licenseExpiration'],
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'license': instance.license,
      'licenseExpiration': instance.licenseExpiration,
      'carBrand': instance.carBrand,
      'carModel': instance.carModel,
      'carColor': instance.carColor,
      'carPlateNumber': instance.carPlateNumber,
      'user': instance.user
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['id'], json['country'], json['email'], json['name'],
      json['phone'], json['state']);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'country': instance.country,
      'state': instance.state,
      'phone': instance.phone
    };
