import 'package:json_annotation/json_annotation.dart';


part 'SingleItemModel.g.dart';

@JsonSerializable()

class SingleItemModel{

    ItemModel item;

    SingleItemModel(this.item);

  factory SingleItemModel.fromJson(Map <String, dynamic> json) => 
      _$SingleItemModelFromJson(json);

}

@JsonSerializable()
class ItemModel{

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
     
      AvgRating avgRating;
      @JsonKey(name: "__meta__")
      Totalrev totalrev;
      
    ItemModel(this.id, this.userId,this.growId, this.name,this.img, this.price, this.deliveryFee,this.productPrice,this.eta, 
    this.quantity,this.description, this.avgRating, this.totalrev);// this.avgRating, this.totalrev);

  factory ItemModel.fromJson(Map <String, dynamic> json) => 
      _$ItemModelFromJson(json);
}



@JsonSerializable()
class AvgRating{
  dynamic itemId;
  dynamic averageRating;
  AvgRating(this.averageRating, this.itemId);
  factory AvgRating.fromJson(Map <String, dynamic> json) => 
      _$AvgRatingFromJson(json);
  
}

@JsonSerializable()
class Totalrev{
  @JsonKey(name: "reviews_count")
  dynamic total;
  Totalrev(this.total);
  factory Totalrev.fromJson(Map <String, dynamic> json) => 
      _$TotalrevFromJson(json);
  
}