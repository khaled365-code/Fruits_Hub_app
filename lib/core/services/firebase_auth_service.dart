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
   if (e.code == 'weak-password') {
    throw Exception('كلمة المرور المدخلة ضعيفة جدًا');
   } else if (e.code == 'email-already-in-use') {
    throw Exception('هذا البريد الإلكتروني مستخدم بالفعل');
   } else {
    throw Exception('حدث خطأ ما، حاول مرة أخرى لاحقًا');
   }
  } catch (e) {
   throw Exception('حدث خطأ ما، حاول مرة أخرى لاحقًا');
  }
 }
}
