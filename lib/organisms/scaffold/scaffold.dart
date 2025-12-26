import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/appbar/appbar.dart';
import 'package:yh_design_system/organisms/background/paper_background.dart';

final class YHScaffold extends StatelessWidget {
  const YHScaffold({
    super.key,
    // PopScope
    this.canPop = true, // 기본 뒤로가기 기능 작동여부 (ios 백스와이프, 안드로이드 백버튼)
    this.onPopInvokedWithResult, // 뒤로가기 감지시 팝업, 광고 등의 행동 하고싶을 때 사용
    // PaperBackground
    this.paperBackground = true, // 종이 배경 사용 여부
    // Scaffold
    this.resizeToAvoidBottomInset = true, // 키보드 올라올 때 줄어들지 여부
    this.scaffoldBackgroundColor = Colors.transparent, // 배경색
    this.appBar, // 상단 앱바
    this.bottomNavigationBar, // 하단 네비게이션 바
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    // RefreshIndicator
    this.onRefresh,
    // SingleChildScrollView
    this.scrollable = false, // 스크롤 가능 여부
    this.scrollController, // 스크롤 컨트롤러
    // SafeArea
    this.outsideSafeAreaFromLTRB, // safeArea. null이면 설정안함
    this.insideSafeAreaFromLTRB, // safeArea. null이면 설정안함
  });

  // PopScope
  final bool canPop;
  final Function(bool, dynamic)? onPopInvokedWithResult;
  // PaperBackground
  final bool paperBackground;
  // Scaffold
  final bool resizeToAvoidBottomInset;
  final Color scaffoldBackgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  // RefreshIndicator
  final RefreshCallback? onRefresh;
  // SingleChildScrollView
  final bool scrollable;
  final ScrollController? scrollController;
  // SafeArea
  final List<bool>? outsideSafeAreaFromLTRB;
  final List<bool>? insideSafeAreaFromLTRB;

  @override
  Widget build(BuildContext context) {
    // 조건에 부합하면 해당 위젯 생성하고 조건에 부합하지 않으면 그냥 반환
    return _buildPopScope(
      _buildOutsideSafeArea(
        _buildPaperBackground(
          _buildScaffold(
            _buildRefreshIndicator(
              _buildSingleChildScrollView(
                _buildInsideSafeArea(body),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopScope(Widget child) {
    // canpop false 이거나, onPopInvokedWithResult 있으면 PopScope 사용
    if (!canPop || onPopInvokedWithResult != null) {
      return PopScope(
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: child,
      );
    }
    return child;
  }

  Widget _buildPaperBackground(Widget child) {
    // paperBackground true 이면 YHPaperBackground 사용
    if (paperBackground) {
      return YHPaperBackground(child: child);
    }
    return child;
  }

  Widget _buildOutsideSafeArea(Widget child) {
    // safeArea 있으면 SafeArea 사용
    if (outsideSafeAreaFromLTRB != null) {
      return SafeArea(
        top: outsideSafeAreaFromLTRB![1],
        bottom: outsideSafeAreaFromLTRB![3],
        left: outsideSafeAreaFromLTRB![0],
        right: outsideSafeAreaFromLTRB![2],
        child: child,
      );
    }
    return child;
  }

  Widget _buildScaffold(Widget child) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: scaffoldBackgroundColor,
      appBar: appBar ?? YHAppBar.defaultAppBar,
      bottomNavigationBar: bottomNavigationBar,
      body: child,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
    );
  }

  Widget _buildRefreshIndicator(Widget child) {
    if (onRefresh != null) {
      return RefreshIndicator(onRefresh: onRefresh!, child: child);
    }
    return child;
  }

  Widget _buildSingleChildScrollView(Widget child) {
    if (scrollable) {
      return SingleChildScrollView(
        controller: scrollController,
        child: child,
      );
    }
    return child;
  }

  Widget _buildInsideSafeArea(Widget child) {
    if (insideSafeAreaFromLTRB != null) {
      return SafeArea(
        top: insideSafeAreaFromLTRB![1],
        bottom: insideSafeAreaFromLTRB![3],
        left: insideSafeAreaFromLTRB![0],
        right: insideSafeAreaFromLTRB![2],
        child: child,
      );
    }
    return child;
  }
}
