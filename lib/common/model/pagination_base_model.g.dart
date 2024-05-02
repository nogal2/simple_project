// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel<T> _$PaginationModelFromJson<T extends PaginationModelItemBase>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationModel<T>(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: PaginateBaseData<T>.fromJson(
          json['data'] as Map<String, dynamic>, (value) => fromJsonT(value)),
    );

Map<String, dynamic> _$PaginationModelToJson<T extends PaginationModelItemBase>(
  PaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

PaginateBaseData<T>
    _$PaginateBaseDataFromJson<T extends PaginationModelItemBase>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
        PaginateBaseData<T>(
          size: (json['size'] as num).toInt(),
          currentPage: (json['currentPage'] as num).toInt(),
          totalPages: (json['totalPages'] as num).toInt(),
          totalElements: (json['totalElements'] as num).toInt(),
          content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
        );

Map<String, dynamic>
    _$PaginateBaseDataToJson<T extends PaginationModelItemBase>(
  PaginateBaseData<T> instance,
  Object? Function(T value) toJsonT,
) =>
        <String, dynamic>{
          'size': instance.size,
          'currentPage': instance.currentPage,
          'totalPages': instance.totalPages,
          'totalElements': instance.totalElements,
          'content': instance.content.map(toJsonT).toList(),
        };
