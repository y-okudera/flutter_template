import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/presentation/component/animation/scale_animation_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final gitHubMarkScaleAnimationProvider =
    Provider.family<ScaleAnimation, ScaleAnimationInput>(
  (ref, scaleAnimationInput) {
    return ScaleAnimation.standard(scaleAnimationInput: scaleAnimationInput);
  },
);

class ScaleAnimation extends HookWidget {
  ScaleAnimation({
    required ImageProvider image,
    required AnimationController scaleAnimationController,
    required TweenSequence<double> scaleAnimation,
    required AnimationController opacityAnimationController,
    required TweenSequence<double> opacityAnimation,
    Key? key,
  })  : _image = image,
        _scaleAnimationController = scaleAnimationController,
        _scaleAnimation = scaleAnimation,
        _opacityAnimationController = opacityAnimationController,
        _opacityAnimation = opacityAnimation,
        super(key: key);

  factory ScaleAnimation.standard({
    required ScaleAnimationInput scaleAnimationInput,
  }) {
    final screenSize = scaleAnimationInput.screenSize;
    final longSide = max(screenSize.width, screenSize.height);
    final shortSide = min(screenSize.width, screenSize.height);

    final scaleAnimationController =
        scaleAnimationInput.scaleAnimationController;
    final opacityAnimationController =
        scaleAnimationInput.opacityAnimationController;
    return ScaleAnimation(
      image: scaleAnimationInput.image,
      scaleAnimationController: scaleAnimationController,
      scaleAnimation: TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(begin: shortSide / 2, end: shortSide / 4),
          weight: 0.4,
        ),
        TweenSequenceItem(
          tween: Tween(begin: shortSide / 4, end: longSide),
          weight: 0.6,
        ),
      ]),
      opacityAnimationController: opacityAnimationController,
      opacityAnimation: TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 1.0),
          weight: 0.4,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 0.0),
          weight: 0.6,
        ),
      ]),
    );
  }

  final ImageProvider _image;
  final AnimationController _scaleAnimationController;
  final TweenSequence<double> _scaleAnimation;
  final AnimationController _opacityAnimationController;
  final TweenSequence<double> _opacityAnimation;

  void startAnimation() {
    _scaleAnimationController.reset();
    _opacityAnimationController.reset();
    _scaleAnimationController.forward();
    _opacityAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimationController,
      builder: (_, __) {
        final opacity =
            _opacityAnimation.animate(_opacityAnimationController).value;
        return Opacity(
          opacity: opacity,
          child: AnimatedBuilder(
            animation: _scaleAnimationController,
            builder: (_, __) {
              final imageOneSideLength =
                  _scaleAnimation.animate(_scaleAnimationController).value;
              return Container(
                height: imageOneSideLength,
                width: imageOneSideLength,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
