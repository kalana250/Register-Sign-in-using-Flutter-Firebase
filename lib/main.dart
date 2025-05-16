import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/models/UserModel.dart';
import 'package:firebase_demo/screens/wrapper.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(initialData: UserModel(uid:""),
    
    value:AuthServices().user,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    ),
    );
  }
}