import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String? get userEmail => _auth.currentUser?.email;
  static String? get userImage => _auth.currentUser?.photoURL;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
      print("Account deleted");
    } catch (e) {
      print("Error deleting account: $e");
    }
  }

  static Future<User?> googleWithSignIn() async {
    try {
      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
      if(googleAccount == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    }catch(e) {
      print('Exception happened: $e');
      return null;
    }
  }

  static Future<User?> signup(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;

    } on FirebaseAuthException catch (e) {
      print('Failed to sign up: $e');
      throw e;
    }
  }

  static Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch(e) {
      print('Failed to login');
      throw e;
    }
  }

  static Future<void> sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print("Verification email sent.");
      } else {
        print("User is null or already verified.");
      }
    } catch (e) {
      print("Error sending email verification: $e");
    }
  }

  static Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print("Password reset email sent");
    } catch (e) {
      print("Error sending password reset email: $e");
      throw e;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
    await googleSignIn.disconnect();
  }

  static Future<User?> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return userCredential.user;
    } catch (e) {
      print('Apple sign-in error: $e');
      return null;
    }
  }
}


