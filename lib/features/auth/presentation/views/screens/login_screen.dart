

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/real_app_bar_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';
import 'package:fruits_commerce_app/features/auth/data/models/login_options_model.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/have_account_question_text.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/login/email_login_text_field.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/login/login_option_container.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/or_withe_dividers_row.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/login/password_login_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  static const List<LoginOptionsModel> loginOptionsDataList=
  [
    LoginOptionsModel(ImageConstants.googleIcon, 'تسجيل بواسطة جوجل'),
    LoginOptionsModel(ImageConstants.appleIcon, 'تسجيل بواسطة أبل'),
    LoginOptionsModel(ImageConstants.facebookIcon, 'تسجيل بواسطة فيسبوك'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: CustomScrollView(
        slivers:
        [

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w,end: 17.w),
              child: Column(
                children:
                [
                  RealAppBarWidget(title: 'تسجيل دخول',),
                  SpaceWidget(height: 24,),
                  EmailLoginTextField(),
                  SpaceWidget(height: 16,),
                  PasswordLoginTextField(),
                  SpaceWidget(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'نسيت كلمة المرور؟',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.c2D9F5D
                      ),),
                    ],
                  ),
                  SpaceWidget(height: 33,),
                  SharedButton(btnText: 'تسجيل دخول', onPressedBtn: (){}),
                  SpaceWidget(height: 33,),
                  HaveAccountQuestionText(
                    onSecondTextPressed: ()
                    {
                      navigate(route: Routes.signUpScreen, context: context);
                    },
                    firstText: 'لا تمتلك حساب؟',
                    secondText: 'قم بإنشاء حساب',),
                  SpaceWidget(height: 49,),
                  OrWithDividersRow(),
                  SpaceWidget(height: 31,),
                  ...List.generate(3,(index)=>Padding(
                    padding: index==1? EdgeInsetsDirectional.symmetric(vertical: 16.h):EdgeInsets.zero,
                    child: LoginOptionContainer(
                      loginIcon: loginOptionsDataList[index].loginIcon,
                       loginOptionText: loginOptionsDataList[index].loginOptionText,
                    ),
                  ),)

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}




