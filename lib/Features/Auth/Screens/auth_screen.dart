import 'package:amazon/Common/Widgets/button.dart';
import 'package:amazon/Common/Widgets/textField.dart';
import 'package:amazon/Constants/global_variable.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final signUpKey = GlobalKey<FormState>();
  final signInKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: signUpKey,
                  child: Column(
                    children: [
                      TextAreas(
                        controller: nameCtrl,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextAreas(
                        controller: emailCtrl,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextAreas(
                        controller: passCtrl,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Button(text: "Sign Up", onpressed: () {})
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign-In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: signUpKey,
                  child: Column(
                    children: [
                      TextAreas(
                        controller: emailCtrl,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextAreas(
                        controller: passCtrl,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Button(text: "Sign In", onpressed: () {})
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
