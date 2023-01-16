import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/camera.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

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
                Offstage(
                  offstage: _selectedTabIndex != 0,
                  child: TickerMode(
                    enabled: _selectedTabIndex == 0,
                    child: Column(
                      children: <Widget>[
                        Expanded(flex: 4, child: _buildQrView(context)),
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                if (result != null) Text('Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}') else Text('Scan a code'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            await controller?.toggleFlash();
                                            setState(() {});
                                          },
                                          child: FutureBuilder(
                                            future: controller?.getFlashStatus(),
                                            builder: (context, snapshot) {
                                              return Text('Flash: ${snapshot.data}');
                                            },
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            await controller?.flipCamera();
                                            setState(() {});
                                          },
                                          child: FutureBuilder(
                                            future: controller?.getCameraInfo(),
                                            builder: (context, snapshot) {
                                              if (snapshot.data != null) {
                                                return Text('Camera facing ${describeEnum(snapshot.data!)}');
                                              } else {
                                                return Text('loading');
                                              }
                                            },
                                          )),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await controller?.pauseCamera();
                                        },
                                        child: Text('pause', style: TextStyle(fontSize: 20)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await controller?.resumeCamera();
                                        },
                                        child: Text('resume', style: TextStyle(fontSize: 20)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Offstage(offstage: _selectedTabIndex != 1, child: TickerMode(enabled: _selectedTabIndex == 1, child: TextField())),
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

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(borderColor: Colors.red, borderRadius: 10, borderLength: 30, borderWidth: 10, cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
