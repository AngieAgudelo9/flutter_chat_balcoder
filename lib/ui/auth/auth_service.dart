import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future <User> getCurrentUser() async {
  User user = _firebaseAuth.currentUser;
  return user; 
}

Future<String>  signIn(String email, String password) async {
  var uid; 
  await _firebaseAuth
  .signInWithEmailAndPassword(email: email, password: password)
  .then((UserCredential userCredential) {
   uid = userCredential.user.uid.toString();

  }); 
  return uid; 
}

singOut() {
  return _firebaseAuth.signOut();

}
}