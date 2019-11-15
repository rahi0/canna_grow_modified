import 'package:json_annotation/json_annotation.dart';

part 'EditItemJson.g.dart';

@JsonSerializable()
class EditItemJson {
  Item item;

  EditItemJson(this.item);

  factory EditItemJson.fromJson(Map<String, dynamic> json) =>
      _$EditItemJsonFromJson(json);
}

@JsonSerializable()
class Item {
  var id;
  var name;
  var deliveryFee;
  var productPrice;
  var description;
  List<Tags> tags;
  //List<Reviews> reviews;

  Item(this.id, this.name, this.deliveryFee, this.productPrice,
      this.description, this.tags);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@JsonSerializable()
class Tags {
  var keyword;

  Tags(this.keyword);

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
}

// @JsonSerializable()
// class Reviews {
//   var content;

//   Reviews(this.content);

//   factory Reviews.fromJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);
// }
