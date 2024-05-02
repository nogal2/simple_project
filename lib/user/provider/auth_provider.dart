import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mustad_test/common/view/root_tab.dart';
import 'package:mustad_test/common/view/splash_screen.dart';
import 'package:mustad_test/user/model/user_model.dart';
import 'package:mustad_test/user/provider/user_provider.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({
    required this.ref,
  }) {
    ref.listen<UserModelBase>(userProvider, (previous, next) {
      // 유저 정보가 변경되면 notifyListeners를 호출하여 구독하고 있는 화면을 갱신합니다.
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: SplashScreen.routeName,
          builder: (_, __) {
            // print(__.name);
            return SplashScreen();
          },
          routes: [
            GoRoute(
              path: 'root_tab',
              name: RootTab.routeName,
              builder: (_, __) {

                return RootTab();
              },
            ),
          ],
        )
      ];

  void logout() {
    // 로그아웃 로직입니다. userProvider의 를 가져와서 로그아웃 로직을 실행합니다.
  }

  String? redirectLogic(GoRouterState state) {
    /**
     * 앱 처음 시작했을때, 토큰이 존재하는지 확인합니다.
     * 토큰이 없으면 로그인 스크린으로, 있다면 홈 스크린으로 이동합니다.
     * 앱을 이용하는 중에도 만약 화면 이동시 accessToken이 만료됐다면 로그인 스크린으로 이동합니다.
     * */


    final UserModelBase user = ref.read(userProvider);
    if (user is UserModelLoading) {
      return null;
    }
    if (user is UserModel) {
      if (state.matchedLocation == '/' ) {
        return state.namedLocation(RootTab.routeName);
      }
      return null;
    }



    return null;

  }
}
