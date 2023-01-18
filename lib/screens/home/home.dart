import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/camera_tab.dart';
import 'package:flutter_application_1/screens/home/home_tab.dart';
import 'package:flutter_application_1/screens/home/setting_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                Offstage(offstage: _selectedTabIndex != 0, child: TickerMode(enabled: _selectedTabIndex == 0, child: const HomeTab())),
                Offstage(
                  offstage: _selectedTabIndex != 1,
                  child: TickerMode(
                    enabled: _selectedTabIndex == 1,
                    child: const CameraTab(),
                  ),
                ),
                Offstage(
                    offstage: _selectedTabIndex != 2,
                    child: TickerMode(
                      enabled: _selectedTabIndex == 2,
                      child: const SettingTab(),
                    ))
              ],
            ),
            extendBody: true,
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera),
                  label: 'Camera',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
              ],
              currentIndex: _selectedTabIndex,
              onTap: _onItemTapped,
            )),
      ),
    ));
  }
}
