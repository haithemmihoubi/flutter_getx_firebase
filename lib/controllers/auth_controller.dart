import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_firebase/views/login_page.dart';
import 'package:flutter_getx_firebase/views/welcomePage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _startScreen);
  }

  _startScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage(email: user.email ?? "Not Found",));
    }
  }

  // Register method wit h email  and password using the firebase method
  register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      //catching errors and displaying it in  a snackbar
      Get.snackbar("Aboout user", "user message",
          backgroundColor: Colors.lightBlueAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            err.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ));
    }
  }

  // login method with email  and password
  login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (err) {
      //catching errors and displaying it in  a snackbar
      Get.snackbar("About user", "user message",
          backgroundColor: Colors.lightBlueAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            err.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ));
    }
  }

  logout() async {
    await auth.signOut();
  }
}
