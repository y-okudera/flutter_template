import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/presentation/route/app_route.dart';
import 'package:flutter_template/presentation/style/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTabScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider(context));
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        HomeRoute(), // FIXME: 他の画面実装後、差し替える
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: theme.appColors.primary,
          unselectedItemColor: theme.appColors.unselected,
          currentIndex: tabsRouter.activeIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Assets.svgs.rocket.svg(
                height: 32,
                color: theme.appColors.unselected,
              ),
              activeIcon: Assets.svgs.rocket.svg(
                height: 32,
                color: theme.appColors.primary,
              ),
              label: "ホーム",
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.telescope.svg(
                height: 32,
                color: theme.appColors.unselected,
              ),
              activeIcon: Assets.svgs.telescope.svg(
                height: 32,
                color: theme.appColors.primary,
              ),
              label: "検索",
            ),
          ],
        );
      },
    );
  }
}
