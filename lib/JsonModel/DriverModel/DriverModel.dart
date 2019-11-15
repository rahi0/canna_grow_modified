import 'package:json_annotation/json_annotation.dart';


part 'DriverModel.g.dart';

@JsonSerializable()
class DriverModel{

    List<Driver> driver;
   

    DriverModel(this.driver);

  factory DriverModel.fromJson(Map <String, dynamic> json) => 
      _$DriverModelFromJson(json);


}

@JsonSerializable()
class Driver{

   var id;
   var userId;
   var license;
   var licenseExpiration;
   var carBrand;
   var carModel;
   var carColor;
   var carPlateNumber;
   User user;


    Driver(this.id, this.userId, this.carBrand, this.carColor, this.carModel, this.carPlateNumber, this.license, 
    this.licenseExpiration,this.user);

  factory Driver.fromJson(Map <String, dynamic> json) => 
      _$DriverFromJson(json);


}



@JsonSerializable()
class User{

   var id;
   var email;
   var name;
   var country;
   var state;
   var phone;
 


    User(this.id, this.country, this.email, this.name, this.phone, this.state);

  factory User.fromJson(Map <String, dynamic> json) => 
      _$UserFromJson(json);


}


