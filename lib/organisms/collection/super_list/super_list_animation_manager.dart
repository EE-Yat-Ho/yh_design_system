import 'package:flutter/material.dart';

class SuperListAnimationManager {
  final TickerProvider tickerProvider;
  final Map<String, AnimationController> _animationControllers = {};
  final Map<String, Animation<double>> _fadeAnimations = {};

  SuperListAnimationManager({required this.tickerProvider});

  void initializeAnimations(List<dynamic> objects) {
    for (final openable in objects) {
      _createAnimationForOpenable(openable);
    }
  }

  void updateAnimations(List<dynamic> objects) {
    // 새로운 openable들에 대한 애니메이션 생성
    for (final openable in objects) {
      if (!_animationControllers.containsKey(openable.id)) {
        _createAnimationForOpenable(openable);
      }
    }

    // 제거된 openable들의 애니메이션 정리
    final currentIds = objects.map((o) => o.id).toSet();
    final toRemove = _animationControllers.keys
        .where((id) => !currentIds.contains(id))
        .toList();
    for (final id in toRemove) {
      _animationControllers[id]?.dispose();
      _animationControllers.remove(id);
      _fadeAnimations.remove(id);
    }

    // 애니메이션 상태 업데이트
    for (final openable in objects) {
      final controller = _animationControllers[openable.id];
      if (controller != null) {
        if (openable.isOpened) {
          controller.forward();
        } else {
          controller.reverse();
        }
      }
    }
  }

  void _createAnimationForOpenable(dynamic openable) {
    final controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: tickerProvider,
    );

    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    _animationControllers[openable.id] = controller;
    _fadeAnimations[openable.id] = fadeAnimation;

    // 초기 상태 설정
    if (openable.isOpened) {
      controller.value = 1.0;
    }
  }

  Animation<double>? getFadeAnimation(String id) {
    return _fadeAnimations[id];
  }

  void dispose() {
    for (final controller in _animationControllers.values) {
      controller.dispose();
    }
    _animationControllers.clear();
    _fadeAnimations.clear();
  }
}
