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
}
