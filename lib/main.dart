import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_firebase/controllers/auth_controller.dart';
import 'package:flutter_getx_firebase/views/login_page.dart';
import 'package:get/get.dart';

void main() async {
  //ensure that flutter is asynchronous and waits for the responses
  WidgetsFlutterBinding.ensureInitialized();

// firebase initialisation
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}
