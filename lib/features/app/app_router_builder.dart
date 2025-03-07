import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/features/pages/resume/resume_route.dart';

@lazySingleton
class RouterBuilder {
  GoRouter build() {
    final navigationKey = GlobalKey<NavigatorState>();
    return GoRouter(
      navigatorKey: navigationKey,
      initialLocation: resumeRoute.path,
      routes: [
        StatefulShellRoute.indexedStack(
          branches: [
            StatefulShellBranch(
              routes: [resumeRoute],
            ),
          ],
          builder: (context, state, navigationShell) {
            return Scaffold(
              body: SelectionArea(
                child: navigationShell,
              ),
            );
          },
        ),
      ],
    );
  }
}
