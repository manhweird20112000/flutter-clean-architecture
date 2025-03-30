import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';

// Router notifier to handle auth state changes
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  AuthState? _authState;

  RouterNotifier(this._ref) {
    _ref.listen<AuthState>(
      authProvider,
      (previous, next) {
        // Chỉ thông báo khi trạng thái xác thực thực sự thay đổi
        if (previous?.status != next.status) {
          _authState = next;
          notifyListeners();
        }
      },
    );
  }

  AuthStatus? get authStatus => _authState?.status;
}

// Use a provider for the router notifier
final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);
  
  return GoRouter(
    refreshListenable: notifier,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      // Lấy trạng thái từ notifier an toàn
      final authStatus = notifier.authStatus;
      
      // Nếu đang xử lý auth hoặc chưa khởi tạo, chuyển đến splash
      if (authStatus == null || authStatus == AuthStatus.initial || authStatus == AuthStatus.loading) {
        // Nếu đã ở splash thì không chuyển hướng
        if (state.fullPath == '/splash') return null;
        return '/splash';
      }
      
      // Đã xác thực
      if (authStatus == AuthStatus.authenticated) {
        // Nếu đang ở splash, login, register thì chuyển về home
        if (state.fullPath == '/splash' || state.fullPath == '/login' || state.fullPath == '/register') {
          return '/';
        }
        return null;
      }
      
      // Chưa xác thực
      if (authStatus == AuthStatus.unauthenticated) {
        // Nếu đang không ở login, register hoặc splash thì chuyển đến login
        if (state.fullPath != '/login' && state.fullPath != '/register' && state.fullPath != '/splash') {
          return '/login';
        }
        // Nếu đang ở splash thì chuyển đến login
        if (state.fullPath == '/splash') {
          return '/login';
        }
        return null;
      }
      
      // Xảy ra lỗi, hiển thị splash để xử lý
      if (authStatus == AuthStatus.error) {
        if (state.fullPath != '/splash') {
          return '/splash';
        }
        return null;
      }
      
      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              'Navigation Error',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Path: ${state.uri.path}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});
