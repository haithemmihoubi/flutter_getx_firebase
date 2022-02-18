import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_getx_firebase/views/login_page.dart';
import 'package:flutter_getx_firebase/views/welcomePage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthController instance = Get.find();

  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _startScreen) ;
  }

  _startScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage());
    }
  }


  register(String email,password) {

auth.createUserWithEmailAndPassword(email: email, password: password) ;


  }




}
