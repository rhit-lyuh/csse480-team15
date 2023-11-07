import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project/component/login_button.dart';
import 'package:project/managers/auth_manager.dart';
import 'package:project/managers/student_data_manager.dart';
import 'package:project/page/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  UniqueKey? _loginUniqueKey;

  @override
  void initState() {
    // TODO: implement initState

    _loginUniqueKey = AuthManager.instance.addLoginObserver(() {
      print("called my login observer");
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    AuthManager.instance.removeObserver(_loginUniqueKey);
    super.dispose();
  }

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
      body: Form(
        key: _formkey,
        child: Column(
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
              child: TextFormField(
                controller: emailTextController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return "Please enter a valid email address";
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Rose-Hulman email',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 350,
                right: 350,
                bottom: 50,
              ),
              child: TextFormField(
                controller: passwordTextController,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Passwords in Firebase must be at least 6 characters";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            LoginButton(
              text: "Sign up",
              clickCallBack: () {
                if (_formkey.currentState!.validate()) {
                  AuthManager.instance.createUserWithEmailPassword(
                      context: context,
                      emailAddress: emailTextController.text,
                      password: passwordTextController.text);
                  setState(() {});
                  
                  if (AuthManager.instance.isSignedIn) {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid form entry")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
