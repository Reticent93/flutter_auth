import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;
  final String text;

  const MyButton({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 40,
        decoration:  BoxDecoration(
            color: Colors.black45,
          borderRadius: BorderRadius.circular(5)
        ),
        child:  Center(
          child: Text(
              text,
            style: const TextStyle(
                color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
