import 'package:json_annotation/json_annotation.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';

part 'other_user_model.g.dart';

@JsonSerializable()
class OtherUserModel extends PaginationModelItemBase {
  final String userId;
  final String name;
  final String email;
  final String phoneNumber;
  final String activeStatus;
  @JsonKey(includeFromJson: false)
  bool isChecked = false;

  OtherUserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.activeStatus,
  });

  factory OtherUserModel.fromJson(Map<String, dynamic> json) =>
      _$OtherUserModelFromJson(json);
}
