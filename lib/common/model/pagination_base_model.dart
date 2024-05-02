import 'package:json_annotation/json_annotation.dart';

part 'pagination_base_model.g.dart';

abstract class PaginationBase {}
abstract class PaginationModelItemBase{}

class PaginationLoading extends PaginationBase {}
class PaginationError extends PaginationBase {
  final String message;

  PaginationError({
    required this.message,
  });
}

class PaginationFetchingMore<T extends PaginationModelItemBase> extends PaginationModel<T> {
  PaginationFetchingMore({
    required super.success,
    required super.message,
    required super.data,
  });
}

class PaginationRefetching<T extends PaginationModelItemBase> extends PaginationModel<T> {
  PaginationRefetching({
    required super.success,
    required super.message,
    required super.data,
  });
}

@JsonSerializable(genericArgumentFactories: true)
class PaginationModel<T extends PaginationModelItemBase> extends PaginationBase {
  final bool success;
  final String message;
  final PaginateBaseData<T> data;

  PaginationModel({
    required this.success,
    required this.message,
    required this.data,
  });

  PaginationModel copyWith({
    bool? success,
    String? message,
    PaginateBaseData<T>? data,
  }) {
    return PaginationModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
  
  factory PaginationModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT)
  => _$PaginationModelFromJson(json, fromJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class PaginateBaseData<T extends PaginationModelItemBase> {
  final int size;
  final int currentPage;
  final int totalPages;
  final int totalElements;
  final List<T> content;

  PaginateBaseData({
    required this.size,
    required this.currentPage,
    required this.totalPages,
    required this.totalElements,
    required this.content,
  });
  
  factory PaginateBaseData.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT)
  => _$PaginateBaseDataFromJson(json, fromJsonT);
}