import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/authentication/screens/loginScreen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard.dart';

// import 'package:quizeapp/utils/Colors.dart';
// import 'package:quizeapp/utils/Constants.dart';

// import '../main.dart';
// import 'admin/AdminDashboardScreen.dart';
// import 'admin/AdminLoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // await Future.delayed(const Duration(seconds: 1));

    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     // print('User is currently signed out!');
    //     Get.offAll(() => LoginScreen());
    //   } else {
    //     // print('User is signed in!');
    //     Get.offAll(() => dashBoard());
    //   }
    // });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor:
        //     appStore.isDarkMode ? scaffoldSecondaryDark : Colors.white,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/splash-screen/APP_LOGO_ROW.png',
                  height: 120),
              const SizedBox(height: 16),
              const Text('SHUBHITHA S ENERGY SOLUTIONS',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    ));
  }
}
