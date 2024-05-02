import 'package:json_annotation/json_annotation.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel extends PaginationModelItemBase {
  final int id;
  final String brandName;
  final BusinessCategory businessCategory;
  final String? ownerName;
  final String phoneNumber;
  final int placeCount;
  final String activated;
  final String createdAt;
  @JsonKey(includeFromJson: false)
  bool isChecked = false;

  BrandModel({
    required this.id,
    required this.brandName,
    required this.businessCategory,
    required this.ownerName,
    required this.phoneNumber,
    required this.placeCount,
    required this.activated,
    required this.createdAt,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json)
  => _$BrandModelFromJson(json);
}

@JsonSerializable()
class BusinessCategory  {
  final int id;
  final String businessCategoryName;

  BusinessCategory({
    required this.id,
    required this.businessCategoryName,
  });

  factory BusinessCategory.fromJson(Map<String, dynamic> json)
  => _$BusinessCategoryFromJson(json);
}