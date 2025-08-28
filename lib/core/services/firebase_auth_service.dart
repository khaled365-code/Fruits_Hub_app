import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {


 Future<User> createUserWithEmailAndPasswordService({required String email, required String password,}) async {
  try {
   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
   );

   return credential.user!;
  } on FirebaseAuthException catch (e) {
   log('Exception in FireBaseAutService.createUserWithEmailAndPasswordService : the exception is ${e.toString()} and code is ${e.code}');
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
   log('Exception in FireBaseAutService.createUserWithEmailAndPasswordService : the exception is ${e.toString()}');
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




}
