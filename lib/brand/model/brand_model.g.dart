// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      id: (json['id'] as num).toInt(),
      brandName: json['brandName'] as String,
      businessCategory: BusinessCategory.fromJson(
          json['businessCategory'] as Map<String, dynamic>),
      ownerName: json['ownerName'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      placeCount: (json['placeCount'] as num).toInt(),
      activated: json['activated'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brandName': instance.brandName,
      'businessCategory': instance.businessCategory,
      'ownerName': instance.ownerName,
      'phoneNumber': instance.phoneNumber,
      'placeCount': instance.placeCount,
      'activated': instance.activated,
      'createdAt': instance.createdAt,
    };

BusinessCategory _$BusinessCategoryFromJson(Map<String, dynamic> json) =>
    BusinessCategory(
      id: (json['id'] as num).toInt(),
      businessCategoryName: json['businessCategoryName'] as String,
    );

Map<String, dynamic> _$BusinessCategoryToJson(BusinessCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessCategoryName': instance.businessCategoryName,
    };
