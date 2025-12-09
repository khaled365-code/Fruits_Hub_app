


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';
import 'package:fruits_commerce_app/core/widgets/real_app_bar_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/forget_pass/forget_pass_send_number_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                  RealAppBarWidget(title: 'نسيان كلمة المرور',),
                  SpaceWidget(height: 24,),
                  Text('لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.c616A6B
                  ),),
                  SpaceWidget(height: 31,),
                  ForgetPassSendNumberTextField(),
                  SpaceWidget(height: 30,),
                  SharedButton(btnText: 'نسيت كلمة المرور', onPressedBtn: ()
                  {
                    navigate(route: Routes.otpScreen, context: context);
                  }),


                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}

