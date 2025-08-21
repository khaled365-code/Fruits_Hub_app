



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/real_app_bar_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/otp_screen/otp_containers_row.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: CustomScrollView(
        slivers:
        [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 17.w,end: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  RealAppBarWidget(title: 'التحقق من الرمز',),
                  SpaceWidget(height: 24,),
                  Text('أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Maxxx@email.com',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.c616A6B
                  ),),
                  SpaceWidget(height: 29,),
                  OtpContainersRow(),
                  SpaceWidget(height: 29,),
                  SharedButton(
                      btnText: 'تحقق من الرمز',
                      onPressedBtn: (){
                        navigate(route: Routes.resetPasswordScreen, context: context);
                      }),
                  SpaceWidget(height: 24,),
                  Center(
                    child: Text('إعادة إرسال الرمز',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.lightPrimaryColor
                    ),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
