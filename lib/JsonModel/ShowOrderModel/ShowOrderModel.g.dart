// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowOrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowOrderModel _$ShowOrderModelFromJson(Map<String, dynamic> json) {
  return ShowOrderModel(
      (json['order'] as List)
          ?.map((e) =>
              e == null ? null : Order.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['success'] as bool);
}

Map<String, dynamic> _$ShowOrderModelToJson(ShowOrderModel instance) =>
    <String, dynamic>{'success': instance.success, 'order': instance.order};

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
      json['id'],
      json['userId'],
      json['sellerId'],
      json['driverId'],
      json['price'],
      json['deliveryFee'],
      json['commend'],
      json['rating'],
      json['status'],
      (json['orderdetails'] as List)
          ?.map((e) => e == null
              ? null
              : Orderdetails.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['buyer'] == null
          ? null
          : Buyer.fromJson(json['buyer'] as Map<String, dynamic>),
      json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>));
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sellerId': instance.sellerId,
      'driverId': instance.driverId,
      'price': instance.price,
      'deliveryFee': instance.deliveryFee,
      'commend': instance.commend,
      'rating': instance.rating,
      'status': instance.status,
      'orderdetails': instance.orderdetails,
      'buyer': instance.buyer,
      'driver': instance.driver
    };

Orderdetails _$OrderdetailsFromJson(Map<String, dynamic> json) {
  return Orderdetails(
      json['orderId'],
      json['quantity'],
      json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>))
    ..id = json['id']
    ..itemId = json['itemId'];
}

Map<String, dynamic> _$OrderdetailsToJson(Orderdetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'item': instance.item
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      json['id'],
      json['growId'],
      json['userId'],
      json['name'],
      json['price'],
      json['img'],
      json['quantity'],
      json['description'],
      json['eta']);
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'growId': instance.growId,
      'name': instance.name,
      'img': instance.img,
      'eta': instance.eta,
      'quantity': instance.quantity,
      'description': instance.description,
      'price': instance.price
    };

Buyer _$BuyerFromJson(Map<String, dynamic> json) {
  return Buyer(
      json['id'],
      json['name'],
      json['state'],
      json['country'],
      json['delAddress'],
      json['delLat'],
      json['delLong'],
      json['img'],
      json['birthday'],
      json['phone'],
      json['email']);
}

Map<String, dynamic> _$BuyerToJson(Buyer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'state': instance.state,
      'img': instance.img,
      'country': instance.country,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'delLat': instance.delLat,
      'delLong': instance.delLong,
      'delAddress': instance.delAddress
    };

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
      json['carBrand'],
      json['carColor'],
      json['carModel'],
      json['carPlateNumber'],
      json['license'],
      json['lat'],
      json['lng'],
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>))
    ..avgRating = json['avgRating'] == null
        ? null
        : AvgRating.fromJson(json['avgRating'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'carBrand': instance.carBrand,
      'carModel': instance.carModel,
      'carColor': instance.carColor,
      'carPlateNumber': instance.carPlateNumber,
      'license': instance.license,
      'lat': instance.lat,
      'lng': instance.lng,
      'user': instance.user,
      'avgRating': instance.avgRating
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['id'], json['delLat'], json['delLong'], json['delAddress'],
      json['img'], json['name'], json['phone']);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'delLat': instance.delLat,
      'delLong': instance.delLong,
      'delAddress': instance.delAddress,
      'name': instance.name,
      'img': instance.img,
      'phone': instance.phone
    };

AvgRating _$AvgRatingFromJson(Map<String, dynamic> json) {
  return AvgRating(json['driverId'], json['averageRating']);
}

Map<String, dynamic> _$AvgRatingToJson(AvgRating instance) => <String, dynamic>{
      'driverId': instance.driverId,
      'averageRating': instance.averageRating
    };
