import 'package:firebase_demo/constants/colors.dart';
import 'package:firebase_demo/constants/description.dart';
import 'package:firebase_demo/constants/styles.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {

  //function
  final Function toggle;

  const SignIn({super.key, required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

//reference to the Authentication class
final AuthServices _auth = AuthServices();

//form key
final _formKey = GlobalKey<FormState>();

//email password state
String email = "";
String password = "";
String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: bgBlack,
      appBar: AppBar(title: Text("SIGN IN",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      ),
      elevation: 0,
      backgroundColor: bgBlack,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              //description
              Text(description,
              style: descriptionStyle,
              ),
              Center(
                child: Image.asset(
                  "assets/images/man.png",
              height: 150,
              ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: textInputDecoration,
                        validator: (value) => 
                        value?.isEmpty == true ? "Enter a valid email" : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      
                
                      SizedBox(
                        height: 20,
                      ),
                        
                      //password
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: textInputDecoration.copyWith(
                          hintText: "password",
                        ),
                        validator: (value) => 
                        value!.length < 6 ? "Enter a valid password" : null,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      
                      SizedBox(
                        height: 20,
                      ),

                      //error message
                      Text(error,
                      style: TextStyle(
                        color: Colors.red
                      ),
                      ),
                        
                      //google
                      Text("Login with Google",
                      style: descriptionStyle
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        //sign in with google
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            "assets/images/google.png",
                              height: 50,
                          ),
                        ),
                      ),
                
                      SizedBox(
                        height: 10,
                      ),
                      
                      //register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                          style: descriptionStyle,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            //go to the register screen
                            onTap: () {
                              widget.toggle();
                            },
                            child: Text("REGISTER",
                            style: TextStyle(
                              color: mainBlue,
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                          ),
                        ],
                      ),
                
                      SizedBox(
                        height: 20,
                      ),
                      
                      //button
                      GestureDetector(
                        //method for login user
                        onTap: () async{
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                          if(result == null){
                            setState(() {
                              error = "Could not signin with those credentrials";
                            });
                          }
                        } ,
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: mainYellow,
                              width: 2,
                            ),
                          ),
                          child: Center(child: Text("LOG IN",
                          style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500
                            ),
                          ),
                          ),
                        ),
                      ),
                
                      SizedBox(
                        height: 15,
                      ),
                
                      //anno button 
                      GestureDetector(
                        //method for login user as annonymous
                        onTap: () async{
                          await _auth.signInAnonymously();    
                        } ,
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: mainYellow,
                              width: 2,
                            ),
                          ),
                          child: Center(child: Text("LOG AS GUEST",
                          style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500
                            ),
                          ),
                          ),
                        ),
                      ),
                
                    ],
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}

//  ElevatedButton( child: Text("Sign In Anonymously"),
//         onPressed: () async {
          
//         },
//       ),