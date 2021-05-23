import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  UserCredential result;

  AuthService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  addStringToSF(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userid', id);
    print('from service ${prefs.getString('userid')}');
  }

  Future<String> signIn({String email, String password}) async {
    // RegExp pattern = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    // if (pattern.hasMatch(email)) {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final userid = _firebaseAuth.currentUser.uid;
      addStringToSF(userid);

      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      result = await _firebaseAuth.currentUser
          .reauthenticateWithCredential(credentials);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    // }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final userid = _firebaseAuth.currentUser.uid;
      addStringToSF(userid);
      return 'Account Created';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    try {
      await result.user.delete().then((_) => _firebaseAuth.signOut());
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> getCurrentUser() async {
    // ignore: await_only_futures
    return await _firebaseAuth.currentUser;
  }
}
