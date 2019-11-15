// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SingleItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleItemModel _$SingleItemModelFromJson(Map<String, dynamic> json) {
  return SingleItemModel(json['item'] == null
      ? null
      : ItemModel.fromJson(json['item'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SingleItemModelToJson(SingleItemModel instance) =>
    <String, dynamic>{'item': instance.item};

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return ItemModel(
      json['id'],
      json['userId'],
      json['growId'],
      json['name'],
      json['img'],
      json['price'],
      json['deliveryFee'],
      json['productPrice'],
      json['eta'],
      json['quantity'],
      json['description'],
      json['avgRating'] == null
          ? null
          : AvgRating.fromJson(json['avgRating'] as Map<String, dynamic>),
      json['__meta__'] == null
          ? null
          : Totalrev.fromJson(json['__meta__'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
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
      'avgRating': instance.avgRating,
      '__meta__': instance.totalrev
    };

AvgRating _$AvgRatingFromJson(Map<String, dynamic> json) {
  return AvgRating(json['averageRating'], json['itemId']);
}

Map<String, dynamic> _$AvgRatingToJson(AvgRating instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'averageRating': instance.averageRating
    };

Totalrev _$TotalrevFromJson(Map<String, dynamic> json) {
  return Totalrev(json['reviews_count']);
}

Map<String, dynamic> _$TotalrevToJson(Totalrev instance) =>
    <String, dynamic>{'reviews_count': instance.total};
