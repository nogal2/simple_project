import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mustad_test/common/secure_storage/secure_storage_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStorageProvider);
  dio.interceptors.add(
    _CustomInterceptor(storage: storage, ref: ref),
  );
  return dio;
});

class _CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;

  _CustomInterceptor({
    required this.storage,
    required this.ref,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print(
        '[REQ] [${options.method}] ${options.uri}');
    // accessToken 로직과 refreshToken 로직을 처리합니다
    /**
     * 요청이 보낼때마다, headers['accestToken'] == 'true'라면(accessToken으로 요청해야 하는 데이터 라면)
     * 실제 토큰을 가져와서 storage에 저장하고
     * headers를 authoriazation: Bearer $token으로 변경해서 요청을 보냅니다.
     * */
    return super.onRequest(options, handler);
  }

// 2) 응답 받을때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        '[REP] [${response.requestOptions.method}] ${response.requestOptions.uri}');
    print('[REP] ${response.data}');
    return super.onResponse(response, handler);
  }

  // 3) 에러가 났을때
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // 토큰 에러가 났을때
    /**
     * 만약 accessToken이 만료됐을 경우 refreshToken으로 재발급 받는 시도를 하고,
     * 토큰이 재발급 되면 다시 새로운 토큰으로 요청합니다.
     * 만약 refreshToken이 만료됐을 경우 에러를 던져 로그아웃을 하고 로그인 페이지로 이동합니다.
     * */
  }
}