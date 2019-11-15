// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowProductJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowProductJson _$ShowProductJsonFromJson(Map<String, dynamic> json) {
  return ShowProductJson((json['allItems'] as List)
      ?.map((e) =>
          e == null ? null : AllItems.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ShowProductJsonToJson(ShowProductJson instance) =>
    <String, dynamic>{'allItems': instance.allItems};

AllItems _$AllItemsFromJson(Map<String, dynamic> json) {
  return AllItems(
      json['id'],
      json['userId'],
      json['growId'],
      json['img'],
      json['name'],
      json['price'],
      json['deliveryFee'],
      json['productPrice'],
      (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['eta'],
      json['quantity'],
      json['description'],
      (json['reviews'] as List)
          ?.map((e) =>
              e == null ? null : Reviews.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AllItemsToJson(AllItems instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'growId': instance.growId,
      'name': instance.name,
      'img': instance.img,
      'price': instance.price,
      'deliveryFee': instance.deliveryFee,
      'description': instance.description,
      'productPrice': instance.productPrice,
      'eta': instance.eta,
      'quantity': instance.quantity,
      'tags': instance.tags,
      'reviews': instance.reviews
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(json['keyword']);
}

Map<String, dynamic> _$TagsToJson(Tags instance) =>
    <String, dynamic>{'keyword': instance.keyword};

Reviews _$ReviewsFromJson(Map<String, dynamic> json) {
  return Reviews(json['itemId'], json['content'], json['rating']);
}

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'rating': instance.rating,
      'content': instance.content
    };
