import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final dynamic clickCallBack;
  const LoginButton({
    super.key,
    required this.text,
    required this.clickCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xff800000),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextButton(
        onPressed: clickCallBack,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
