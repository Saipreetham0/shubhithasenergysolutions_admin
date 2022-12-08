import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/authentication/screens/loginScreen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/AdminPanel.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/dashboard_screen.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/users/users.dart';

//

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  final db = FirebaseFirestore.instance;

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLoging ? 0 : 0), () {
      // Timer( Duration(seconds: 0), () {
      if (user == null) {
        isLoging = false;
        update();
       
        Get.offAllNamed('/login');
      } else {
        isLoging = true;
        update();

        db.collection('users').doc(user.uid).get().then((value) {
          if (value.exists) {
            if (value.data()!['role'] == 'admin') {
              Get.offAllNamed('/dashboard');
              // Get.offAllNamed('siteVisitReportDetails');
            } else {
              Get.offAllNamed('/not-admin');
            }
          } else {
            // Get.offAllNamed('/users');
          }
        });

        // Get.offAllNamed('/users');
      }
    });
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      //define error
      getErrorSnackBar("Login Failed", e);
    }
  }

  void forgorPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar("Reset mail sent successfully. Check mail!");
      Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Error", e);
    }
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  void signOut() async {
    await auth.signOut();
  }
}
