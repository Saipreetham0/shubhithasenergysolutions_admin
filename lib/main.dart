import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/authentication/screens/loginScreen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/AdminPanel.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/dashboard_screen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/NotAdmin/notAdmin.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/error/error.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/notifications/notifications.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/settings/settings.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/siteVistReport/siteVistReportDetails_screen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/siteVistReport/siteVistReport_Screen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/splash_screen/splash_screen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/totalQuotations/totalQuotations.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/users/users.dart';
import 'package:shubhithasenergysolutions_admin/scr/utils/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController());
  // Get.put(NavigationController());
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shubhitha S Energy Solutions',
      debugShowCheckedModeBanner: false,

      theme: KspAppTheme.lightTheme,
      darkTheme: KspAppTheme.darkTheme,
      // themeMode: ThemeMode.dark,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.fadeIn,

      // initialRoute: AppPages.initial,
      // getPages: AppPages.routes,

      // routes: {
      //   '/login': (context) => LoginScreen(),
      //   '/dashboard': (context) => dashboard(),
      //   '/splash': (context) => SplashScreen(),
      // },
      initialRoute: '/',
      unknownRoute: GetPage(
        name: '/not-found',
        title: 'Not Found',
        page: () => PageNotFound(),
      ),

      getPages: [
        GetPage(
          name: '/',
          title: 'Splash',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => const dashboard(),
          title: 'dashboard',
        ),
        GetPage(
          name: '/admin',
          page: () => adminPanel(),
        ),
        GetPage(
          name: '/siteVistReports',
          title: 'Site Vist Reports',
          page: () => const siteVistReportScreen(),
        ),
        GetPage(
            name: '/totalQuotations',
            title: 'Total Quotations',
            page: () => const totalQuotationsScreen()),
        GetPage(
          name: '/notifications',
          title: 'Notifications',
          page: () => const notificationsScreen(),
        ),
        GetPage(
          name: '/users',
          title: 'Users',
          page: () => const usersScreen(),
        ),
        GetPage(
          name: '/settings',
          title: 'Settings',
          page: () => const settingsScreen(),
        ),
        GetPage(
          name: '/not-admin',
          title: 'Not Admin',
          page: () => const notAdmin(),
        ),
        GetPage(
          name: '/siteVisitReportDetails',
          title: 'Site Visit Report Details',
          page: () => const siteVistReportDetails(),
        )
      ],

      home: SplashScreen(),
    );
  }
}
