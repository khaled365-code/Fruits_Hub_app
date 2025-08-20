

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key,required this.currentPageIndex});

  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children:
            [
              currentPageIndex==0?
              Align(
                alignment: AlignmentDirectional.topCenter,
                  child: SvgPicture.asset(
                      width: MediaQuery.sizeOf(context).width,
                      ImageConstants.onBoardFirstBackIcon)):
              Align(
                alignment: AlignmentDirectional.topCenter,
                  child: SvgPicture.asset(
                    width: MediaQuery.sizeOf(context).width,
                      ImageConstants.onBoardSecBackIcon)),

              currentPageIndex==0?
              PositionedDirectional(
                  top: 182.h,
                  start: 62.w,
                  end: 62.w,
                  child: SvgPicture.asset(ImageConstants.fruitsDishIcon),):
              PositionedDirectional(
                top: 173.h,
                start: 75.w,
                end: 75.w,
                child: SvgPicture.asset(ImageConstants.anasIcon),),

            ],
          ),
          SpaceWidget(height: 64,),
          currentPageIndex==0?
          Column(
            children:
            [
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: 'مرحبًا بك في',style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.textColors[ThemeCubit().currentTheme]
                    )),
                    TextSpan(text: ' ',style: Theme.of(context).textTheme.displaySmall),
                    TextSpan(text: 'Fruit',style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.secondaryColor
                    )),
                    TextSpan(text: 'HUB',style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.primaryColor
                    ),),
                  ]
              ),),
      
              SpaceWidget(height: 24,),
      
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 37.w),
                child: Text(
                  textAlign: TextAlign.center,
                  'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.c4E5556
                  ),),
              )
            ],
          ):
          Column(
            children:
            [
              Text('ابحث وتسوق',style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textColors[ThemeCubit().currentTheme]
              ),),
              SpaceWidget(height: 24,),
              Padding(
                padding:  EdgeInsetsDirectional.symmetric(horizontal: 40.w),
                child: Text('نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.c4E5556
                ), textAlign: TextAlign.center,),
              )
      
      
            ]
          )
        ],
      ),
    );
  }
}
