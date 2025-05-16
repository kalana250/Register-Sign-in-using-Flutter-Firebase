import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/models/UserModel.dart';

class AuthServices{

//firebase instance
final FirebaseAuth _auth = FirebaseAuth.instance;

//create a user from firebase user with uid
UserModel? _userwithFirebaseUserUid(User? user){
  return user != null ? UserModel(uid: user.uid) : null;
}

//create the stream  for checking the auth changes in the user
Stream<UserModel?>get user{
 return _auth.authStateChanges().map(_userwithFirebaseUserUid);
}

//Sign in anonymous
Future signInAnonymously() async{
  try{
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return _userwithFirebaseUserUid(user);
  } catch(err){
    print(err.toString());
    return null;
  }
  
}

// register user email and password
Future registerWithEmailAndPassword(String email, String password) async{
  try{
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email, password: password
      );
      User? user = result.user;
      return _userwithFirebaseUserUid(user);
  }catch(err){
    print(err.toString());
    return null;
  }
}

// sign in with email and password
Future signInWithEmailAndPassword(String email, String password) async{
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email, password: password
      );
      User? user = result.user;
      return _userwithFirebaseUserUid(user);
  }
  catch(err){
    print(err.toString());
    return null;
  }
}

// sign in with gmail

// sign out
Future signOut() async{
  try{
   return await _auth.signOut();
  }catch(err){
    print(err.toString());
    return null;
  }
}

}