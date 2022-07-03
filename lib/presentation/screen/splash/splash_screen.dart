import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/presentation/component/animation/scale_animation.dart';
import 'package:flutter_template/presentation/component/animation/scale_animation_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationDuration = 500;
    final scaleAnimationInput = ScaleAnimationInput(
      scaleAnimationController: useAnimationController(
        duration: Duration(milliseconds: animationDuration),
      ),
      opacityAnimationController: useAnimationController(
        duration: Duration(milliseconds: animationDuration),
      ),
      screenSize: MediaQuery.of(context).size,
    );

    final scaleAnimation = ref.read(
      gitHubMarkScaleAnimationProvider(scaleAnimationInput),
    );

    // 画面回転時に回転前のアニメーションを継続する
    // 画面回転時にアニメーションを最初からやり直す場合は、第二引数のkeysを指定しない
    useEffect(() {
      scaleAnimation.startAnimation();
      Future.delayed(Duration(milliseconds: animationDuration)).then((value) {
        // TODO: router.replaceで画面遷移
      });
      return;
    }, []);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: scaleAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
