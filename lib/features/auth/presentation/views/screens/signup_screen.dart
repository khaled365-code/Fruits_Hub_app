import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_progress_hud_widget.dart';
import 'package:fruits_commerce_app/core/widgets/real_app_bar_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/have_account_question_text.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/signup/conditions_acceptance_row.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/signup/signup_email_text_field.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/signup/signup_password_text_field.dart';

import '../widgets/signup/signup_name_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var signUpCubit = context.read<SignupCubit>();
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: BlocConsumer<SignupCubit,SignupState>(
        listener: (context, state)
        {
          if(state.requestState==RequestStates.error)
            {
              buildSnackBarMessage(text: state.errorMessage!, context: context,errorMessage: true);
            }
          if (state.requestState==RequestStates.success)
            {
              buildSnackBarMessage(text: 'تم إنشاء الحساب بنجاح', context: context);
            }
        },
      builder: (context, state) {
        return CustomProgressHudWidget(
         isLoading: state.requestState==RequestStates.loading?true:false,
         child: CustomScrollView(
           slivers:
           [

             SliverToBoxAdapter(
               child: Padding(
                 padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                 child: Form(
                   key: signUpCubit.signupFormKey,
                   autovalidateMode: state.validateMode,
                   child: Column(
                     children:
                     [

                       RealAppBarWidget(title: 'حساب جديد',),
                       SpaceWidget(height: 24,),
                       SignUpNameTextField(
                         controller: signUpCubit.nameController,),
                       SpaceWidget(height: 16,),
                       SignupEmailTextField(
                         controller: signUpCubit.emailController,),
                       SpaceWidget(height: 16,),
                       PasswordSignUpTextField(
                         controller: signUpCubit.passwordController,),
                       SpaceWidget(height: 16,),
                       ConditionsAcceptanceRow(),
                       SpaceWidget(height: 30,),
                       SharedButton(
                           btnText: 'إنشاء حساب جديد',
                           onPressedBtn: ()
                           {
                             if (signUpCubit.signupFormKey.currentState!.validate())
                             {
                               if (state.termsAndConditionsActive == true)
                               {
                                 signUpCubit.signupFormKey.currentState!.save();
                                 signUpCubit.createUserWithEmailAndPassword(
                                     email: signUpCubit.emailController.text,
                                     password: signUpCubit.passwordController.text,
                                     name: signUpCubit.nameController.text);
                               }
                               else {
                                 buildSnackBarMessage(context: context,
                                     text: 'الشروط والأحكام يجب الموافقة عليها');
                               }
                             }
                             else {
                               signUpCubit.activateValidateMode();
                             }
                           }),
                       SpaceWidget(height: 26,),
                       HaveAccountQuestionText(
                         onSecondTextPressed: () {
                           Navigator.pop(context);
                         },
                         firstText: 'تمتلك حساب بالفعل؟',
                         secondText: 'تسجيل دخول',
                       ),


                     ],
                   ),
                 ),
               ),
             )

           ],
         ),
        );
  },
),
    );
  }
}
