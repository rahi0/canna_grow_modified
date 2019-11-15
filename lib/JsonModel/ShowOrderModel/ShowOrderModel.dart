import 'package:json_annotation/json_annotation.dart';

part 'ShowOrderModel.g.dart';

@JsonSerializable()
class ShowOrderModel {

  bool success;
  List<Order> order;
 

  ShowOrderModel(this.order,this.success);

  factory ShowOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ShowOrderModelFromJson(json);
}


@JsonSerializable()
class Order{

      var id;
      var userId;   
      var sellerId;
      var driverId;
      var price;
      var deliveryFee;
      var commend;
      var rating;
      var status;
      List<Orderdetails> orderdetails;
      Buyer buyer;
      Driver driver;

    Order(this.id, this.userId,this.sellerId,this.driverId, this.price, this.deliveryFee,this.commend,this.rating, this.status, this.orderdetails, this.buyer,this.driver);

  factory Order.fromJson(Map <String, dynamic> json) => 
      _$OrderFromJson(json);


}


@JsonSerializable()
class Orderdetails{

     var id;
     var orderId;
     var itemId;
     var quantity;
     Item item;


    Orderdetails(this.orderId, this.quantity, this.item );

  factory Orderdetails.fromJson(Map <String, dynamic> json) => 
      _$OrderdetailsFromJson(json);


}


@JsonSerializable()
class Item {
  var id;
  var userId;
  var growId;
  var name;
  var img;
  var eta;
  var quantity;
  var description;
  var price;
 
  Item(this.id, this.growId, this.userId,  this.name, this.price, this.img, this.quantity, this.description, this.eta);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@JsonSerializable()
class Buyer {
  
  var id;
  var name;
  var email;
  var state;
  var img;
  var country;
 var birthday;
 var phone;
  var delLat;
  var delLong;
  var delAddress;

 
  Buyer(this.id, this.name,this.state, this.country,this.delAddress,this.delLat, this.delLong, this.img, this.birthday, this.phone, this.email);

  factory Buyer.fromJson(Map<String, dynamic> json) => _$BuyerFromJson(json);
}

@JsonSerializable()
class Driver {
  
  var carBrand;
  var carModel;
  var carColor;
  var carPlateNumber;
  var license;
  var lat;
  var lng;
  User user;
  AvgRating avgRating;

 
  Driver(this.carBrand, this.carColor, this.carModel, this.carPlateNumber, this.license,this.lat, this.lng, this.user);

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}


@JsonSerializable()
class User {
  
  var id;
  var delLat;
  var delLong;
  var delAddress;
  var name;
  var img;
  var phone;
  

 
  User(this.id, this.delLat, this.delLong, this.delAddress, this.img, this.name, this.phone);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class AvgRating {
  
  var driverId;
  var averageRating;
 

 
  AvgRating(this.driverId, this.averageRating);

  factory AvgRating.fromJson(Map<String, dynamic> json) => _$AvgRatingFromJson(json);
}