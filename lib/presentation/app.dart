import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/presentation/route/app_route.dart';
import 'package:flutter_template/presentation/style/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider(context));

    final appRouter = useMemoized(AppRouter.new);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme,
      darkTheme: appTheme.darkTheme,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
