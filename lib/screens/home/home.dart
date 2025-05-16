import 'package:firebase_demo/constants/colors.dart';
import 'package:firebase_demo/constants/description.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //create a object from AuthServices class
  final AuthServices _auth = AuthServices();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      backgroundColor: bgBlack,
        appBar: AppBar(
          elevation: 0,
        backgroundColor: bgBlack,

        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(bgBlack),
            ),
            onPressed: () async {
            await _auth.signOut();
          },
          child: Icon(Icons.logout,
          ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text("HOME",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
              ),

              SizedBox(
                height: 30,
              ),

              Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textLight,
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
              ),

              SizedBox(
                height: 50,
              ),

              Center(
                child: Image.asset(
                  "assets/images/man.png",
                 height: 150,
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}