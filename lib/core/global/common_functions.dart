


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/auth/data/mapper/user_model_to_domain.dart';
import 'package:fruits_commerce_app/features/home/data/models/review_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/carts_entity.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/review_entity.dart';
import 'package:fruits_commerce_app/features/splash/presentation/views/screens/splash_screen.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entities/user_entity.dart';


navigate({required String route,required BuildContext context,bool replaced=false,Object? args,bool removeAllStack=false})
{
  removeAllStack==true?
  Navigator.pushNamedAndRemoveUntil(context,route,(route)=>false):
  replaced==true?
      Navigator.pushReplacementNamed(context, route,arguments: args):
      Navigator.pushNamed(context, route,arguments: args);


}

buildMaterialBannerWidget({required BuildContext context, required String text})
{
   ScaffoldMessenger.of(context).showMaterialBanner(
       MaterialBanner(
           elevation: 0,
           backgroundColor: AppColors.primaryColor,
           leading: Icon(Icons.error, color: Colors.white),
           content: Text(text,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
               color: Colors.white
           )),
           onVisible: ()
           {
             Future.delayed(const Duration(milliseconds: 300), () {
               ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
             });
           },
           actions: [SizedBox()]));

}


buildSnackBarMessage({required String text,required BuildContext context,bool errorMessage=false,bool showCloseIcon=false})
{
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: showCloseIcon,
          duration: Duration(milliseconds: 700),
          behavior: SnackBarBehavior.fixed,
          content: Row(
            children:
            [
              Text(text,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white
              ),),
            ],
          ),
        )
    );

}

UserEntity getUserData()
{
  Map<String,dynamic> decodedUserData=jsonDecode(CacheService().getString(key: AppConstants.userData)!);
  UserModel userModel = UserModel.fromJson(decodedUserData);
  return UserModelToDomain.convertUserModelToUserEntity(userModel: userModel);
}


num getAvgRate({required List<ReviewModel> reviews})
{
   num avgSum=0;
   for(var item in reviews)
     {

       avgSum+=item.rate;
     }
   return (avgSum/reviews.length);

}

num calculateShippingDiscount()
{
   return 0;
}

int calculatePriceAfterDiscountAndShipping(CartsEntity carts)
{

  return (carts.calculateAllCartsPrice().toInt() + AppConstants.shippingPrice) - calculateShippingDiscount().toInt();

}


String getCurrentUserId()
{
  var decodedId= jsonDecode(CacheService().getString(key: AppConstants.userData)!);
  UserModel userModel=UserModel.fromJson(decodedId);
  return userModel.userId;

}


