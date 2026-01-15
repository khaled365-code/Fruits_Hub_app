import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/services/service_locator.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit=context.read<SignupCubit>();
    return BlocBuilder<SignupCubit,SignupState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: ()
          {
            signupCubit.changeTermsAndConditions();
          },
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: ShapeDecoration(
                color: state.termsAndConditionsActive == true ? AppColors.primaryColor : AppColors
                    .backgroundColors[ThemeCubit().currentTheme],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: state.termsAndConditionsActive == false ? BorderSide(
                        color: AppColors.cDDDFDF,
                        width: 1.5.w
                    ) : BorderSide.none
                )
            ),
            child: state.termsAndConditionsActive == true
                ? Center(child: SvgPicture.asset(ImageConstants.checkTrueIcon))
                : SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
