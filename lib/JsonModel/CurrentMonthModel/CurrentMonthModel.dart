import 'package:json_annotation/json_annotation.dart';

part 'CurrentMonthModel.g.dart';

@JsonSerializable()
class CurrentMonthModel {
   
   var  sellerId;
   var total;
   var month;
  

  CurrentMonthModel(this.sellerId, this.total,this.month);

  factory CurrentMonthModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentMonthModelFromJson(json);
}


