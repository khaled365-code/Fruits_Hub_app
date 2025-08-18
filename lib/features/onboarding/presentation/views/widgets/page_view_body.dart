
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/onboarding/presentation/views/widgets/dot_indicator_widget.dart';
import 'package:fruits_commerce_app/features/onboarding/presentation/views/widgets/page_view_item.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({super.key});

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {

  late PageController pageController;
  int currentPageIndex=0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose()
  {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 2,
                controller: pageController,
                itemBuilder: (context, index) => PageViewItem(currentPageIndex: currentPageIndex,),),),
            SpaceWidget(height: 64,),
            currentPageIndex==0?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index)=> index==1?
                const DotIndicatorWidget(notActive: true,) : Padding(
                  padding:  EdgeInsetsDirectional.only(end: 10.w),
                  child:  DotIndicatorWidget(),
                ))
            ):
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index)=> Padding(
                  padding:  EdgeInsetsDirectional.only(end: 10.w),
                  child: const DotIndicatorWidget(),
                ),)
            ),
            SpaceWidget(height: 29,),
            Visibility(
              visible: currentPageIndex==1,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SharedButton(btnText: 'ابدأ الان', onPressedBtn: () async
                {
                  navigate(route: Routes.loginScreen,context: context,replaced: true);
                  await CacheService().setBool(key:AppConstants.onBoardIsOpened,value: true);

                }),
              ),
            ),
            SpaceWidget(height: 43,),

          ],
        ),
        currentPageIndex==0?
        Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w,top: 39.h),
          child: GestureDetector(
            onTap:() async
            {
              navigate(route: Routes.loginScreen,context: context,replaced: true);
              await CacheService().setBool(key:AppConstants.onBoardIsOpened,value: true);

            },
            child: Text('تخط',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.c949D9E
            ),),
          ),):
        SizedBox.shrink(),
      ],
    );
  }
}
