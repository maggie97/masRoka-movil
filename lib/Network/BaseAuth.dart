import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'UserDefaults.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password, String nombre, String apellido);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  static Auth instance = Auth();

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    authStatus = AuthStatus.LOGGED_IN;
    return user.uid;
  }

  Future<String> signUp(String email, String password, String nombre, String apellido) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    UserDefaults.shared.email = user.email;
    UserDefaults.shared.userId = user.uid;
    registroDB(nombre, apellido);
    authStatus = AuthStatus.LOGGED_IN;
    return user.uid;
  }

  registroDB(String nombre, String apellido){
    return Firestore.instance.collection('users').document('${UserDefaults.shared.email}')//.collection('productos').document('$idProducto')
      .setData({ 'Nombre' : nombre,'Apellido': apellido, 'email': UserDefaults.shared.email, 'uuid':UserDefaults.shared.userId }, merge: true);
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}