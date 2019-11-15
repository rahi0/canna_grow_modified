
import 'package:json_annotation/json_annotation.dart';

part 'YearlyAvgModel.g.dart';

@JsonSerializable()
class YearlyAvgModel {
   
   var  sellerId;
  var avg;
  

  YearlyAvgModel(this.sellerId, this.avg);

  factory YearlyAvgModel.fromJson(Map<String, dynamic> json) =>
      _$YearlyAvgModelFromJson(json);
}


