import 'package:go_router/go_router.dart';
import 'package:movies_app/features/home/presentation/views/home_view.dart';
import 'package:movies_app/features/home/presentation/views/movie_detailes_view.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kMovieDetailesView = '/movieDetailesView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kMovieDetailesView,
        builder: (context, state) => const MovieDetailesView(),
      ),
    ],
  );
}
