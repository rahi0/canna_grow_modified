// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EditItemJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditItemJson _$EditItemJsonFromJson(Map<String, dynamic> json) {
  return EditItemJson(json['item'] == null
      ? null
      : Item.fromJson(json['item'] as Map<String, dynamic>));
}

Map<String, dynamic> _$EditItemJsonToJson(EditItemJson instance) =>
    <String, dynamic>{'item': instance.item};

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      json['id'],
      json['name'],
      json['deliveryFee'],
      json['productPrice'],
      json['description'],
      (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'deliveryFee': instance.deliveryFee,
      'productPrice': instance.productPrice,
      'description': instance.description,
      'tags': instance.tags
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(json['keyword']);
}

Map<String, dynamic> _$TagsToJson(Tags instance) =>
    <String, dynamic>{'keyword': instance.keyword};
