import 'package:flutter/material.dart';
import 'package:flutter_getx_firebase/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'login_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15,top:0,right: 15,bottom: 0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: w,
                  height: h * 0.19,
                  child: Image.asset("assets/images/add-user.png")),
              SizedBox(
                width: w,
                height: h * 0.15,
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hintText: 'Enter Your Email ',
                      prefixIcon: Icon(Icons.email_outlined)),
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 6,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ]),
                child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        hintText: 'Enter Your password ',
                        prefixIcon: Icon(Icons.password_outlined))),
              ),
              SizedBox(
                height: 30,
              ),Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 6,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ]),
                child: TextField(

                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        hintText: 'Confirm Your password ',
                        prefixIcon: Icon(Icons.password_outlined))),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w * 0.5,
                  ),
                  Text(
                    "Forgot your password ?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(

               style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    onPrimary: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.grey,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),

                    ),),
                  onPressed: () {
                    AuthController.instance.register(
                        emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do you have an account  ?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginPage());
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),

                  //Icon(Icons.go)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(EvaIcons.googleOutline, color: Colors.blue, size: 45),
                  Icon(
                    EvaIcons.twitter,
                    color: Colors.blue,
                    size: 45,
                  ),
                  Icon(
                    EvaIcons.facebookOutline,
                    color: Colors.blue,
                    size: 45,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
