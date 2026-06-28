import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase{
  User? get currentUser;

  // Future<String> getUid();

  Future<User?> loginWithEmailAndPassword(String email, String password);

  Future<User?> signUpWithEmailAndPassword(String email, String password);

  Future<bool?> signUpWithGoogle();

  Future<User?> signUpWithFacebook();

  Future<User?> signUpWithApple();

  Future<void> logout();

  Stream<User?> authStateChanges();

  Future<void> sendPasswordResetEmail(String email);
}


class AuthServices implements AuthBase{

  final FirebaseAuth _firebaseAuth ;
  // final GoogleSignIn _googleSignIn ;

  AuthServices({required FirebaseAuth firebaseAuth}) :  _firebaseAuth = firebaseAuth;
  

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password)async {
    final usercredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return usercredential.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(String email, String password) async{
    final usercredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return usercredential.user;
  }

  @override
  Future<void> logout() async => await _firebaseAuth.signOut();

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
  
  @override
  Future<void> sendPasswordResetEmail(String email) => _firebaseAuth.sendPasswordResetEmail(email: email);
  
  @override
  Future<User?> signUpWithApple() {
    // TODO: implement signUpWithApple
    throw UnimplementedError();
  }
  
  @override
  Future<User?> signUpWithFacebook() {
    // TODO: implement signUpWithFacebook
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> signUpWithGoogle() async {
    // TODO: implement signUpWithGoogle
    throw UnimplementedError();
  }
}