



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: CustomScrollView(
        slivers: 
        [
          CommonAppBar(title: 'الدفع',hasNotification: false,hasBackBtn: false,),
          SliverToBoxAdapter(
            child: Column(
              children:
              [
                const SpaceWidget(height: 67,),
                Center(child: SvgPicture.asset(ImageConstants.checkBigTrueIcon),),
                const SpaceWidget(height: 33,),
                Center(
                  child: Text('تم بنجاح !',style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.textColors[ThemeCubit().currentTheme],
                      fontSize: 16
                  ),),
                ),
                const SpaceWidget(height: 9,),
                Text('رقم الطلب : 1245789663#',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.c4E5556,
                    fontSize: 16
                ),),

              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children:
              [
                 Spacer(),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 16.w),
                   child: SharedButton(btnText: 'تتبع الطلب', onPressedBtn: (){
                     navigate(route: Routes.trackOrderScreen, context: context);

                   }),
                 ),
                const SpaceWidget(height: 16,),
                InkWell(
                  onTap: ()
                  {
                    navigate(route: Routes.mainLayoutScreen, context: context,removeAllStack: true);
                  },
                  child: Text('الرئيسية',style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline
                  ),),
                ),
                const SpaceWidget(height: 130,),



              ],
            ),
          )

        ],
      ),
    );
  }
}


