import 'package:flutter/material.dart';
import 'package:project/component/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Rose-Hulman",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff800000),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Rose-Hulman Login",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 350,
              right: 350,
              top: 50,
            ),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 350,
              right: 350,
              bottom: 50,
            ),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          LoginButton(
            text: "Sign in",
            clickCallBack: () {},
          ),
        ],
      ),
    );
  }
}
