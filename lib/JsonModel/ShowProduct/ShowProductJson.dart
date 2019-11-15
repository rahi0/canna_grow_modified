import 'package:json_annotation/json_annotation.dart';


part 'ShowProductJson.g.dart';

@JsonSerializable()
class ShowProductJson{

    List<AllItems> allItems;

    ShowProductJson(this.allItems);

  factory ShowProductJson.fromJson(Map <String, dynamic> json) => 
      _$ShowProductJsonFromJson(json);


}

@JsonSerializable()
class AllItems{

      var id;
      var userId;
      var growId;
      var name;
      var img;
      var price;
      var deliveryFee;    
      var description;      
      var productPrice;
      var eta;
      var quantity;
      List<Tags> tags;
      List<Reviews> reviews;
      // AvgRating avgRating;
      // @JsonKey(name: "__meta__")
      // Totalrev totalrev;
      
  AllItems(this.id, this.userId,this.growId,this.img, this.name, this.price, this.deliveryFee,this.productPrice,this.tags, this.eta, 
    this.quantity,this.description, this.reviews);// this.avgRating, this.totalrev);

  factory AllItems.fromJson(Map <String, dynamic> json) => 
      _$AllItemsFromJson(json);
}

@JsonSerializable()
class Tags {
  var keyword;

  Tags(this.keyword);

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
}

@JsonSerializable()
class Reviews {

  var itemId;
  var rating;
  var content;

  Reviews(this.itemId,this.content,this.rating);

  factory Reviews.fromJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);
}

