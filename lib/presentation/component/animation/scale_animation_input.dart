import 'package:flutter/material.dart';

class ScaleAnimationInput {
  const ScaleAnimationInput({
    required this.image,
    required this.scaleAnimationController,
    required this.opacityAnimationController,
    required this.screenSize,
  });

  final ImageProvider image;
  final AnimationController scaleAnimationController;
  final AnimationController opacityAnimationController;
  final Size screenSize;
}
