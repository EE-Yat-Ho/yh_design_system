import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

final class YHBottomNavigationBar extends StatefulWidget {
  const YHBottomNavigationBar({super.key, required this.screens});

  final List<Widget> screens;

  @override
  State<YHBottomNavigationBar> createState() => _BottomNavigationBarState();
}

final class _BottomNavigationBarState extends State<YHBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("🏗️ $this build");
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 86, 69, 69),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // fixed or shifting
        currentIndex: _currentIndex,
        selectedItemColor: YHColor.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: widget.screens,
      ),
    );
  }
}
