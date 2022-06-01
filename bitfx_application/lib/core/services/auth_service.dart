import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

//Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

// Send Email Verification
  Future<void> sendEmailVerification() async {
    try {
      final user = _firebaseAuth.currentUser!;
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print("[FirebaseService] Email verification exception : $e");
    }
  }

//Sign In authentication
  Future<bool> signIn({String? email, String? password}) async {
    try {
      UserCredential userCred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email as String, password: password as String);
      if (userCred.user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      print("[FirebaseService] inside siginIn Exception is : $e");
      return false;
    }
  }

//SIgnup and create users credentials in firestore
  Future<bool> signUp({
    String? name,
    String? email,
    String? password,
    String? confirmPass,
  }) async {
    try {
      UserCredential userCred =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: email as String, password: password as String);
      if (userCred.user != null) {
        await _firebaseFirestore
            .collection("userData")
            .doc(userCred.user!.email)
            .set({
          "name": name,
          "email": userCred.user?.email,
          "password": password,
          "confirmpassword": confirmPass,
        });
        //return true;
      } else {
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      print("[FirebaseService] inside siginUp Exception is : $e");
      return false;
    }
  }

// Reset / Forgot password
  Future<String> resetPassword({String? email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email as String);
    return email;
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  String? getEmail() {
    return _firebaseAuth.currentUser?.email;
  }


  Future<void> uploadimage() async {
     final user = _firebaseAuth.currentUser!;
final _uid = user.uid;
 await  FirebaseFirestore.instance.collection('images').doc(_uid).set({
'imageUrl' : '',
  });
  }

  Future<void> getimageurl( _file) async {
    String url;
final ref = FirebaseStorage.instance.ref().child('usersimages').child('.jpg');
await ref.putFile(_file);
url = await ref.getDownloadURL();
  }
 }
