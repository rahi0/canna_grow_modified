// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShopReviewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopReviewModel _$ShopReviewModelFromJson(Map<String, dynamic> json) {
  return ShopReviewModel(
      (json['itemReview'] as List)
          ?.map((e) =>
              e == null ? null : ItemReview.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['averageReview'] as List)
          ?.map((e) => e == null
              ? null
              : AverageReview.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ShopReviewModelToJson(ShopReviewModel instance) =>
    <String, dynamic>{
      'itemReview': instance.itemReview,
      'averageReview': instance.averageReview
    };

ItemReview _$ItemReviewFromJson(Map<String, dynamic> json) {
  return ItemReview(
      json['id'],
      json['itemId'],
      json['growId'],
      json['userId'],
      json['rating'],
      json['content'],
      json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ItemReviewToJson(ItemReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'growId': instance.growId,
      'itemId': instance.itemId,
      'rating': instance.rating,
      'content': instance.content,
      'item': instance.item,
      'user': instance.user
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      json['id'],
      json['growId'],
      json['userId'],
      json['name'],
      json['img'],
      json['price'],
      json['eta'],
      json['description'],
      json['quantity']);
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'growId': instance.growId,
      'name': instance.name,
      'img': instance.img,
      'price': instance.price,
      'eta': instance.eta,
      'quantity': instance.quantity,
      'description': instance.description
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'],
      json['delLat'],
      json['delLong'],
      json['delAddress'],
      json['email'],
      json['name'],
      json['img'],
      json['country'],
      json['state'],
      json['phone'],
      json['birthday']);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'delLat': instance.delLat,
      'delLong': instance.delLong,
      'delAddress': instance.delAddress,
      'email': instance.email,
      'name': instance.name,
      'img': instance.img,
      'country': instance.country,
      'state': instance.state,
      'birthday': instance.birthday,
      'phone': instance.phone
    };

AverageReview _$AverageReviewFromJson(Map<String, dynamic> json) {
  return AverageReview(json['avgRating']);
}

Map<String, dynamic> _$AverageReviewToJson(AverageReview instance) =>
    <String, dynamic>{'avgRating': instance.avgRating};
