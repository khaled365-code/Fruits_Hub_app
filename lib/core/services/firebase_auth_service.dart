import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {

  String _getMessage(String arMessage, String enMessage) {
    return LocalizationCubit().currentLanguage == 'ar' ? arMessage : enMessage;
  }

  Future<User> createUserWithEmailAndPasswordService({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        log('Exception in FireBaseAuthService.createUserWithEmailAndPasswordService : ${e.toString()} code: ${e.code}');
      }
      if (e.code == 'weak-password') {
        throw Exception(_getMessage(
          'كلمة المرور المدخلة ضعيفة جدًا',
          'The password provided is too weak',
        ));
      } else if (e.code == 'email-already-in-use') {
        throw Exception(_getMessage(
          'هذا البريد الإلكتروني مستخدم بالفعل',
          'This email is already in use',
        ));
      } else if (e.code == 'network-request-failed') {
        throw Exception(_getMessage(
          'حدث خطأ في الشبكة، حاول مرة أخرى لاحقًا',
          'A network error occurred, please try again later',
        ));
      } else {
        throw Exception(_getMessage(
          'حدث خطأ ما، حاول مرة أخرى لاحقًا',
          'Something went wrong, please try again later',
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        log('Exception in FireBaseAuthService.createUserWithEmailAndPasswordService : ${e.toString()}');
      }
      throw Exception(_getMessage(
        'حدث خطأ ما، حاول مرة أخرى لاحقًا',
        'Something went wrong, please try again later',
      ));
    }
  }

  Future<User> signInUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        log('Exception in FireBaseAuthService.signInUsingEmailAndPassword : ${e.toString()} code: ${e.code}');
      }
      if (e.code == 'user-not-found') {
        throw Exception(_getMessage(
          'البريد الإلكتروني أو كلمة المرور غير صحيحة',
          'Incorrect email or password',
        ));
      } else if (e.code == 'wrong-password') {
        throw Exception(_getMessage(
          'البريد الإلكتروني أو كلمة المرور غير صحيحة',
          'Incorrect email or password',
        ));
      } else if (e.code == 'network-request-failed') {
        throw Exception(_getMessage(
          'حدث خطأ في الشبكة، حاول مرة أخرى لاحقًا',
          'A network error occurred, please try again later',
        ));
      } else if (e.code == 'invalid-credential') {
        throw Exception(_getMessage(
          'بيانات تسجيل الدخول غير صحيحة أو انتهت صلاحيتها',
          'Invalid credentials or credentials have expired',
        ));
      } else {
        throw Exception(_getMessage(
          'حدث خطأ ما، حاول مرة أخرى لاحقًا',
          'Something went wrong, please try again later',
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        log('Exception in FirebaseAuthService.signInUsingEmailAndPassword : ${e.toString()}');
      }
      throw Exception(_getMessage(
        'حدث خطأ ما، حاول مرة أخرى لاحقًا',
        'Something went wrong, please try again later',
      ));
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var result =
      await FirebaseAuth.instance.signInWithCredential(credential);
      return result.user!;
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle : ${e.toString()}');
      throw Exception(_getMessage(
        'حدث خطأ ما , يرجي المحاوله لاحقًا',
        'Something went wrong, please try again later',
      ));
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString);
      var result =
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      return result.user!;
    } on MissingPluginException catch (e) {
      if (kDebugMode) {
        log('Exception in FirebaseAuthService.signInWithFacebook : ${e.toString()}');
      }
      throw Exception(_getMessage(
        'تسجيل الدخول عبر فيسبوك غير متاح حاليًا',
        'Facebook sign-in is currently unavailable',
      ));
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithFacebook : ${e.toString()}');
      throw Exception(_getMessage(
        'حدث خطأ ما , يرجي المحاوله لاحقًا',
        'Something went wrong, please try again later',
      ));
    }
  }

  Future<void> deleteAccount() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }
}