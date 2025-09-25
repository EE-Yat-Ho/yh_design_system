import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/organisms/dialog/app_exit_dialog.dart';
import 'package:yh_design_system/organisms/scaffold/scaffold.dart';

final class YHBottomNavigationBar extends StatefulWidget {
  const YHBottomNavigationBar({
    super.key,
    required this.screens,
    required this.items,
  });

  final List<Widget> screens;
  final List<BottomNavigationBarItem> items;

  @override
  State<YHBottomNavigationBar> createState() => _BottomNavigationBarState();
}

final class _BottomNavigationBarState extends State<YHBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("🏗️ $this build");
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
          currentIndex: _currentIndex,
          selectedItemColor: YHColor.primary,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent, // Container 색상을 사용
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: widget.items,
        ),
        // ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: widget.screens,
      ),
    );
  }
}
