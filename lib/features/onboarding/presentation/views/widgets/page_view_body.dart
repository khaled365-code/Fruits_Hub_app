



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return  Column(
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
        currentPageIndex==1?
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SharedButton(btnText: 'ابدأ الان', onPressedBtn: (){}),
        ):
        SizedBox.shrink(),

        currentPageIndex==1?
        SpaceWidget(height: 43,):
        SizedBox.shrink()

      ],
    );
  }
}
