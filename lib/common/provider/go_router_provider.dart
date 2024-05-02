import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mustad_test/user/provider/auth_provider.dart';


final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.watch(authProvider);
  return GoRouter(
    routes: provider.routes,
    initialLocation: '/',
    refreshListenable: provider,
    redirect: (context, state) => provider.redirectLogic(state),
  );
});