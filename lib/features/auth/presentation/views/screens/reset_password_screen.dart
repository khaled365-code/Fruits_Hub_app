

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/custom_alert_dialog.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/real_app_bar_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/reset_password/confirm_new_password_text_field.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/reset_password/new_password_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: buildCommonAppBar(),
    body: CustomScrollView(
      slivers:
      [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w,end: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                RealAppBarWidget(title: 'كلمة مرور جديدة',),
                SpaceWidget(height: 24,),
                Text('قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textColors[ThemeCubit().currentTheme]
                ),),
                SpaceWidget(height: 34,),
                NewPasswordTextFormField(),
                SpaceWidget(height: 24,),
                ConfirmNewPasswordTextField(),
                SpaceWidget(height: 24,),
                SharedButton(
                    btnText: 'إنشاء كلمة مرور جديدة',
                    onPressedBtn: ()
                    {
                      showDialog(context: context, builder: (context) => CustomAlertDialog(),);
                    })

              ],
            ),
          ),
        )
      ],
    ),

    );
  }
}
