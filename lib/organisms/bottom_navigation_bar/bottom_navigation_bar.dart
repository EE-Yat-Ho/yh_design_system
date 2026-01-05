import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/organisms/dialog/app_exit_dialog.dart';
import 'package:yh_design_system/organisms/scaffold/scaffold.dart';

final class YHBottomNavigationBar extends StatelessWidget {
  const YHBottomNavigationBar({
    super.key,
    required this.screens,
    required this.items,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  final List<Widget> screens;
  final List<BottomNavigationBarItem> items;

  /// 현재 선택된 인덱스 (외부에서 관리)
  final int currentIndex;

  /// 인덱스 변경 시 호출되는 콜백
  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return YHScaffold(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          showAppExitDialog(context, () => SystemNavigator.pop());
        }
      },
      paperBackground: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: YHColor.surfaceDefault,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              offset: const Offset(0, -2),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: YHColor.primary,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent, // Container 색상을 사용
          onTap: onIndexChanged,
          items: items,
          selectedLabelStyle: YHFont.regular14.style(),
          unselectedLabelStyle: YHFont.regular12.style(),
        ),
        // ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}
