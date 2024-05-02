import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mustad_test/common/secure_storage/secure_storage_provider.dart';
import 'package:mustad_test/user/model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase>((ref)  {
  final storage = ref.watch(secureStorageProvider);
  return UserStateNotifier(storage: storage);
});

class UserStateNotifier extends StateNotifier<UserModelBase> {
  final FlutterSecureStorage storage;

  UserStateNotifier({
    required this.storage,
  }) : super(UserModelLoading()) {
    // 유저 정보 가져오기
    getUser();
  }

  Future<void> getUser() async {
    // 유저 정보를 가져오는 로직입니다.
    await Future.delayed(Duration(seconds: 1));
    // 유저 정보 있다고 가정
    state = UserModel();

  }

  Future<void> login() async {
    // 로그인 로직입니다.
  }

  Future<void> logout() async {
    // 로그아웃 로직입니다.
  }


}