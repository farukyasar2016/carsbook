import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future <UserCredential> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // une fois connecté, renvoyez l'indentifiant de l'utilisateur
    return await _auth.signInWithCredential(credential);
  }

  // l'état de l'utilisateur en temps réel
  Stream<User?> get user => _auth.authStateChanges() ;

  // déconnexion
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    return  _auth.signOut();
  }


}

