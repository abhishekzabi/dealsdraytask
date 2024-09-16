// import 'dart:async';

// import 'package:dealsdray/presentation/screens/login_phone_email.dart';
// import 'package:dealsdray/presentation/screens/signup_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   void initState() {
//     super.initState();

//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Login()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/bgold.png"),
//                     fit: BoxFit.cover)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 const Column(
//                   children: [
//                     Center(
//                       child: SpinKitCircle(
//                           size: 100, color: Color.fromARGB(255, 255, 255, 255)),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 150,
//                 ),
//                 Container(
//                   height: 200,
//                   width: 300,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/images/logo.png")),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// presentation/screens/splash_screen.dart

import 'dart:async';

import 'package:dealsdray/models/splash_model.dart';
import 'package:dealsdray/servives/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login_phone_email.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DeviceService deviceService=DeviceService();
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      await sendDeviceInfo();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  Future<void> sendDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoModel(
        deviceType: 'android',
        deviceId: '123456789', 
        deviceName: 'Test Device', 
        deviceOSVersion: 'Android 10', 
        deviceIPAddress: '192.168.1.100', 
        lat: 37.7749,
        long: -122.4194,
        buyerGcmid: '',
        buyerPemid: '',
        app: AppInfo(
          version: '1.0.0',
          installTimeStamp: DateTime.now(),
          uninstallTimeStamp: DateTime.now(),
          downloadTimeStamp: DateTime.now(),
        ),
      );

      final result = await deviceService.sendDeviceInfo(deviceInfo);

      if (!result) {
        print('Failed to send device info');
      }
    } catch (e) {
      print('Error sending device info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash1.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: SpinKitCircle(
                    size: 100,
                    color: const Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
                SizedBox(height: 150),
                Container(
                  height: 200,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
