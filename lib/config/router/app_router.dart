import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/counter',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      pageBuilder: (context, state) => animationSlideUpTransition(
        child: const AppTutorialScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: '/infinite',
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: '/bottom-app-bar',
      name: BottomAppBarScreen.name,
      builder: (context, state) => const BottomAppBarScreen(),
    ),
    GoRoute(
      path: '/navigation-rail',
      name: NavigationRailScreen.name,
      builder: (context, state) => const NavigationRailScreen(),
    ),
    GoRoute(
      path: '/slider-screen',
      name: SliderScreen.name,
      pageBuilder: (context, state) => animationSlideRightTransition(
        child: const SliderScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: '/theme',
      name: ThemeChanger.name,
      pageBuilder: (context, state) => animationFadeTransition(
        child: const ThemeChanger(),
        key: state.pageKey,
      ),
    ),
  ],
);

// Animación de Transición SlideUp
dynamic animationSlideUpTransition(
    {required Widget child, required LocalKey key}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.easeInOut);

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );
    },
  );
}

// Animación de Transición SlideRight
dynamic animationSlideRightTransition({
  required Widget child,
  required LocalKey key,
}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.easeInOut);

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );
    },
  );
}

// Animación de Transición Fade
dynamic animationFadeTransition({
  required Widget child,
  required LocalKey key,
}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.easeInOut);

      return FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(curvedAnimation),
        child: child,
      );
    },
  );
}
