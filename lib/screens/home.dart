import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
    return Material(
        child: Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                Offstage(
                  offstage: _selectedTabIndex != 0,
                  child: TickerMode(
                    enabled: _selectedTabIndex == 0,
                    child: const TextField(),
                  ),
                ),
                Offstage(
                    offstage: _selectedTabIndex != 1,
                    child: TickerMode(
                      enabled: _selectedTabIndex == 1,
                      child: TakePictureScreen(camera: camera),
                    )),
                Offstage(
                    offstage: _selectedTabIndex != 2,
                    child: TickerMode(
                      enabled: _selectedTabIndex == 2,
                      child: ElevatedButton(
                          onPressed: () {
                            context.goNamed('setting');
                          },
                          child: Text('Go setting')),
                    )),
              ],
            ),
            extendBody: true,
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: 'Calls',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera),
                  label: 'Camera',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chats',
                ),
              ],
              currentIndex: _selectedTabIndex,
              onTap: _onItemTapped,
            )),
      ),
    ));
  }
}
