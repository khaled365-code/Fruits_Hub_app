


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/real_app_bar_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/have_account_question_text.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/signup/conditions_acceptance_row.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/signup/signup_email_text_field.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/signup/signup_password_text_field.dart';

import '../widgets/signup/signup_name_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers:
          [

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w,end: 16.w),
                child: Column(
                  children:
                  [

                    RealAppBarWidget(title: 'حساب جديد',),
                    SpaceWidget(height: 24,),
                    SignUpNameTextField(),
                    SpaceWidget(height: 16,),
                    SignupEmailTextField(),
                    SpaceWidget(height: 16,),
                    PasswordSignUpTextField(),
                    SpaceWidget(height: 16,),
                    ConditionsAcceptanceRow(),
                    SpaceWidget(height: 30,),
                    SharedButton(
                        btnText: 'إنشاء حساب جديد',
                        onPressedBtn: (){}),
                    SpaceWidget(height: 26,),
                    HaveAccountQuestionText(
                      onSecondTextPressed: ()
                      {
                        Navigator.pop(context);
                      },
                    firstText: 'تمتلك حساب بالفعل؟',
                    secondText: 'تسجيل دخول',
                    )




                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
