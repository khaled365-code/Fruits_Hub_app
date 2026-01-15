import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseAuthService {



 Future<void> deleteAccount() async
 {
  await FirebaseAuth.instance.currentUser!.delete();
 }

 Future<User> createUserWithEmailAndPasswordService({required String email, required String password,}) async
 {
  try {
   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
   );

   return credential.user!;
  } on FirebaseAuthException catch (e) {
   if(kDebugMode)
    {
     log('Exception in FireBaseAutService.createUserWithEmailAndPasswordService : the exception is ${e.toString()} and code is ${e.code}');
    }
   if (e.code == 'weak-password') {
    throw Exception('كلمة المرور المدخلة ضعيفة جدًا');
   } else if (e.code == 'email-already-in-use') {
    throw Exception('هذا البريد الإلكتروني مستخدم بالفعل');
   } else if(e.code=='network-request-failed')
    {
     throw Exception('حدث خطأ في الشبكة، حاول مرة أخرى لاحقًا');
    }
   else {
    throw Exception('حدث خطأ ما، حاول مرة أخرى لاحقًا');
   }
  } catch (e) {
   if(kDebugMode)
    {
     log('Exception in FireBaseAutService.createUserWithEmailAndPasswordService : the exception is ${e.toString()}');
    }
   throw Exception('حدث خطأ ما، حاول مرة أخرى لاحقًا');
  }
 }


  Future<User> signInUsingEmailAndPassword({required String email,required String password}) async
  {

   try
   {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return credential.user!;
   } on FirebaseAuthException catch (e) {
    log('Exception in FireBaseAutService.signInUsingEmailAndPassword : the exception is ${e.toString()} and code is ${e.code}');
    if (e.code == 'user-not-found') {
     throw Exception('البريد الإلكتروني أو كلمة المرور غير صحيحة');
    } else if (e.code == 'wrong-password') {
     throw Exception('البريد الإلكتروني أو كلمة المرور غير صحيحة');
    }
    else if (e.code=='network-request-failed')
     {
      throw Exception('حدث خطأ في الشبكة، حاول مرة أخرى لاحقًا');
     }
    else if(e.code=='invalid-credential')
     {
      throw Exception('بيانات تسجيل الدخول غير صحيحة أو انتهت صلاحيتها');
     }
     else
     {
      throw Exception('حدث خطأ ما، حاول مرة أخرى لاحقًا');
     }
   } catch (e)
   {
    log('Exception in FirebaseAuthService.signInUsingEmailAndPassword and the exception is : ${e.toString()}');
    throw Exception('حدث خطأ ما، حاول مرة أخرى لاحقًا');
   }

  }


   Future<User> signInWithGoogle() async
    {

     // Trigger the authentication flow
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

     // Obtain the auth details from the request
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

     // Create a new credential
     final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
     );

     // Once signed in, return the UserCredential
     var result = await FirebaseAuth.instance.signInWithCredential(credential);
     return result.user!;


    }


 Future<User> signInWithFacebook() async {
  try {
   // Trigger the sign-in flow
   final LoginResult loginResult = await FacebookAuth.instance.login();

   // Create a credential from the access token
   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

   // Once signed in, return the UserCredential
   var result = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
   return result.user!;

  } on MissingPluginException catch (e)
  {
   if(kDebugMode)
     {
       log('Exception in FirebaseAuthService.signInWithFacebook and the exception is ${e.toString()}');
     }
   throw Exception('تسجيل الدخول عبر فيسبوك غير متالح حاليا');
  } catch (e)
  {
   log('Exception in FirebaseAuthService.signInWithFacebook and the exception is ${e.toString()}');
   throw Exception('حدث خطأ ما , يرجي المحاوله لاحقًا');
  }
 }







}
