import 'package:flutter/material.dart';
import 'package:flutter_auth/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.business_outlined,
                size: 100,
              ),
              const Text(
                'Welcome back Kotter!',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),

              MyTextField(
              controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 20),

              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
               const Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 30),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text(
                        'Forgot Password?',
                      style: TextStyle(color: Colors.orangeAccent),
              ),
                   ],
                 ),
               )

            ],
          ),
        ),
      ),
    );
  }
}
