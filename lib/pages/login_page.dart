import 'package:flutter/material.dart';
import 'package:flutter_auth/components/my_button.dart';
import 'package:flutter_auth/components/my_textfield.dart';
import 'package:flutter_auth/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.business_outlined,
                size: 100,
              ),
              const Text(
                'Welcome! Please Log In',
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
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              MyButton(
                onTap: signInUser,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: .05,
                      color: Colors.grey[800],
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          'Or continue with',
                        style: TextStyle(color: Colors.orangeAccent),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: .05,
                      color: Colors.grey[800],
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 50),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/images/google.png'),
                  SizedBox(width: 10,),
                  SquareTile(imagePath: 'lib/images/apple.png'),

                ],
              ),
               const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member?',style: TextStyle(color: Colors.orangeAccent),
              ),
              SizedBox(width: 4,),
              Text('Register now',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          )
            ],
          ),
        ),
      ),
    );
  }
}
