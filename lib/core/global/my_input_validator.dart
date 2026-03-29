

import 'package:email_validator/email_validator.dart';

abstract class MyInputValidator
{


  static String? basicValidation(String? value)
  {
     if(value ==null || value.isEmpty)
       {
         return 'الرجاء إدخال قيمة';
       }
     else
       {
         return null;
       }
  }

  static String? validateEmail(String? value)
  {
    if(value ==null || value.isEmpty)
    {
      return 'الرجاء إدخال البريد الإلكتروني';
    }
    else if(EmailValidator.validate(value)==false)
      {
        return 'البريد الإلكتروني غير صحيح';
      }
    else
    {
      return null;
    }
  }




}