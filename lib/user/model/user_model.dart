abstract class UserModelBase {}

class UserModelLoading extends UserModelBase {}
class UserModelError extends UserModelBase {
  final String message;

  UserModelError({required this.message});
}

// 유저 모델 예시입니다.
class UserModel extends UserModelBase {
}