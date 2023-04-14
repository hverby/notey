import 'package:flutter/material.dart';
import 'package:note/screens/auth/widgets/register.dart';
import 'package:note/screens/auth/widgets/signIn.dart';

class AuthPage extends StatefulWidget {
  static const routeName = "/auth";
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView:  toggleView);
    } else {
      return Register(toggleView:  toggleView);
    }
  }
}
