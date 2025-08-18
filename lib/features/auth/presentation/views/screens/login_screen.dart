

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';
import 'package:fruits_commerce_app/features/auth/data/models/login_options_model.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/login_option_container.dart';

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
      body: SafeArea(
          child: CustomScrollView(
            slivers:
            [
              SliverToBoxAdapter(child: SpaceWidget(height: 11,)),
              buildCommonAppBar(title: 'تسجيل دخول', context: context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 16.w,end: 17.w),
                  child: Column(
                    children:
                    [

                      SpaceWidget(height: 24,),
                      CustomTextFormField(
                        hintText: 'البريد الإلكتروني',
                        contentPadding: EdgeInsetsDirectional.only(start: 20.w,top: 15.h,bottom: 17.h),
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.emailAddress,
                        inputDataStyle: TextStyle(),
                      ),
                      SpaceWidget(height: 16,),
                      CustomTextFormField(
                        hintText: 'كلمة المرور',
                        contentPadding: EdgeInsetsDirectional.only(start: 20.w,top: 15.h,bottom: 17.h,),
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.text,
                        inputDataStyle: TextStyle(),
                        suffix: Padding(
                          padding: EdgeInsetsDirectional.only(end: 33.w),
                          child: SvgPicture.asset(ImageConstants.passwordEyeIcon),
                        ),
                      ),
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
                      RichText(
                        text: TextSpan(
                        children:
                        [
                          TextSpan(text: 'لا تمتلك حساب؟ ',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.c949D9E
                          ),),
                          TextSpan(text: 'قم بإنشاء حساب',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.primaryColor
                          ),)
                        ]
                      ),),
                      SpaceWidget(height: 49,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: AppColors.cf2f3f3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w),
                            child: Text('أو',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.c0C0D0D
                            ),),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: AppColors.cf2f3f3,
                            ),
                          ),
                        ],
                      ),
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
          ),),
    );
  }
}
