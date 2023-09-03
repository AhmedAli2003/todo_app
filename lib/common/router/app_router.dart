import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/providers/shared_preferences_provider.dart';
import 'package:todo_app/common/router/app_routes.dart';
import 'package:todo_app/features/auth/pages/login_page.dart';
import 'package:todo_app/features/auth/pages/otp_page.dart';
import 'package:todo_app/features/onboarding/pages/on_boarding_page.dart';
import 'package:todo_app/features/todos/pages/home_page.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref));

class AppRouter {
  final Ref _ref;
  const AppRouter(this._ref);

  GoRouter get appRouter {
    if (!_ref.read(sPHandlerProvider).hasOnBoardingShowen()) {
      return _appRouter;
    }
    return _initialRouter;
  }
}

final GoRouter _initialRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: AppRoutes.otp,
          builder: (context, state) => const OtpPage(),
        ),
      ],
    ),
  ],
);

final GoRouter _appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
