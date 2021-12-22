import 'package:flutter/material.dart';
import 'package:clean_app/screens/advertisement/advertisement_screen.dart';
import 'package:clean_app/screens/orders_management/orders_management.dart';
import 'package:clean_app/screens/profiles/personal/profile_screen.dart';
import 'package:clean_app/screens/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<_PagesData> pages = [
    _PagesData(
        iconPath: 'asset/images/profile_navigation.png',
        title: 'Profile',
        page: ProfileScreen()),
    _PagesData(
        iconPath: 'asset/images/store_navigation.png',
        title: 'Store',
        page: OrdersManagement()),
    _PagesData(
        iconPath: 'asset/images/advertise_navigation.png',
        title: 'Advertise',
        page: AdvertisementScreen()),
    _PagesData(
        iconPath: 'asset/images/setting_navigation.png',
        title: 'Settings',
        page: SettinsgScreen()),
  ];

  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(child: pages[_currentTab].page),
    );
  }

  Widget _bottomNavigationBar() {
    return Builder(builder: (context) {
      final color = Theme.of(context).primaryColor;
      return BottomNavigationBar(
          selectedItemColor: color,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentTab,
          onTap: (index) => setState(() {
                _currentTab = index;
              }),
          showUnselectedLabels: true,
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor),
          items: [
            for (int i = 0; i < pages.length; i++)
              BottomNavigationBarItem(
                  icon: Image.asset(
                    pages[i].iconPath,
                    color: _currentTab == i ? color : null,
                  ),
                  label: pages[i].title)
          ]);
    });
  }
}

class _PagesData {
  String iconPath;
  String title;
  Widget page;
  _PagesData({required this.iconPath, required this.title, required this.page});
}
