// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherUserModel _$OtherUserModelFromJson(Map<String, dynamic> json) =>
    OtherUserModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      activeStatus: json['activeStatus'] as String,
    );

Map<String, dynamic> _$OtherUserModelToJson(OtherUserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'activeStatus': instance.activeStatus,
    };
