import 'package:flutter/material.dart';
import 'package:flutter_getx_firebase/controllers/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  final String email;

  const WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("welcome$email"),
          ElevatedButton(
              onPressed: () async {
                await AuthController.instance.logout();
              },
              child: Text("Sign out"))
        ],
      ),
    );
  }
}
