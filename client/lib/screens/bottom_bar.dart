import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:tiklogistics/screens/history_screen.dart';
import 'package:tiklogistics/screens/home_screen.dart';
import 'package:tiklogistics/screens/settings_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // _selectedIndex = index;
    // print('Tapped index is ${_selectedIndex}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xff0185cd),
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_history_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_history_filled),
              label: "History"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
              label: "Settings"),
        ],
      ),
    );
  }
}
