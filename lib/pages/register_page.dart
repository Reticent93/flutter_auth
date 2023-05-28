import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/my_button.dart';
import 'package:flutter_auth/components/my_textfield.dart';
import 'package:flutter_auth/components/square_tile.dart';
import 'package:flutter_auth/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  void signUpUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //create user
    try {
      if(passwordController.text == confirmPasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match'), backgroundColor: Colors.red,
          dismissDirection: DismissDirection.down)
        );
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User Not Found'), backgroundColor: Colors.red,
                dismissDirection: DismissDirection.down)
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Is Incorrect'), backgroundColor: Colors.red,
                dismissDirection: DismissDirection.down)
        );
      }

    } finally {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  //Wrong Email Popup
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Email'),
          );
        });
  }

  //Wrong Password Popup
  void wrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect password'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 50),
              const Icon(
                Icons.business_outlined,
                size: 100,
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child:  Row(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Row(
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        ' Login now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              ),
              const SizedBox(height: 15),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),
              const SizedBox(height: 10),
              MyButton(
                text: 'Sign Up',
                onTap: signUpUser,
              ),
              const SizedBox(height: 10),
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
                    ),
                    Expanded(
                        child: Divider(
                          thickness: .05,
                          color: Colors.grey[800],
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 40),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  SquareTile(
                      onTap: (){},
                      imagePath: 'lib/images/apple.png'),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
