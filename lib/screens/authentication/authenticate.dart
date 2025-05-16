import 'package:firebase_demo/screens/authentication/register.dart';
import 'package:firebase_demo/screens/authentication/sign_in.dart';

import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signinPage = true;

  //togle pages
  void switchPage(){
    setState(() {
      signinPage = !signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(signinPage == true){
      return SignIn(toggle: switchPage);
    } else {
      return Register(toggle: switchPage);
    }
  }
}