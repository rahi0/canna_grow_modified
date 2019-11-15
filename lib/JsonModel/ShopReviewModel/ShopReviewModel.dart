import 'package:json_annotation/json_annotation.dart';


part 'ShopReviewModel.g.dart';

@JsonSerializable()
class ShopReviewModel{

    List<ItemReview> itemReview;
    List<AverageReview> averageReview;
     

    ShopReviewModel(this.itemReview,this.averageReview);

  factory ShopReviewModel.fromJson(Map <String, dynamic> json) => 
      _$ShopReviewModelFromJson(json);


}

@JsonSerializable()
class ItemReview{

      var id;
      var userId;
      var growId;
      var itemId;
      var rating;
      var content;
      Item item;
      User user;

    ItemReview(this.id, this.itemId, this.growId, this.userId, this.rating, this.content,this.item, this.user);

  factory ItemReview.fromJson(Map <String, dynamic> json) => 
      _$ItemReviewFromJson(json);


}

@JsonSerializable()
class Item{

      var id;
      var userId;
      var growId;
      var name;
      var img;
      var price;
      var eta;
      var quantity;
      var description;

   Item(this.id,this.growId, this.userId, this.name, this.img, this.price, this.eta, this.description, this.quantity);

  factory Item.fromJson(Map <String, dynamic> json) => 
      _$ItemFromJson(json);


}


@JsonSerializable()
class User{

      var id;
      var delLat;
      var delLong;
      var delAddress;
      var email;
      var name;
      var img;
      var country;
      var state;
      var birthday;
      var phone;

   User(this.id,this.delLat, this.delLong, this.delAddress, this.email, this.name, this.img, this.country, this.state, this.phone, this.birthday);

  factory User.fromJson(Map <String, dynamic> json) => 
      _$UserFromJson(json);


}

@JsonSerializable()
class AverageReview{

      var avgRating;
     

   AverageReview(this.avgRating);

  factory AverageReview.fromJson(Map <String, dynamic> json) => 
      _$AverageReviewFromJson(json);


}
