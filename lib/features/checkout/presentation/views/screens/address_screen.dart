


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/services/logger_service.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/address_screen/address_field.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/address_screen/city_field.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/address_screen/email_field.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/address_screen/floor_number_field.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/address_screen/name_field.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/checkout_progress_bar.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/address_screen/save_address_switch.dart';

import '../widgets/address_screen/phone_text_field.dart' show PhoneFiled;

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

   String? name;
   String? email;
   String? address;
   String? city;
   String? floor;
   String? phone;
  final GlobalKey<FormState> formKey = GlobalKey();
  final ValueNotifier<AutovalidateMode> formValidationMode = ValueNotifier(AutovalidateMode.disabled);


  @override
  void dispose() {
    formValidationMode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    OrderEntity orderEntity = ModalRoute.of(context)!.settings.arguments as OrderEntity;
    LoggerService().logDebug('Rebuild The UI');
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: CustomScrollView(
        slivers:
        [
          CommonAppBar(title: 'العنوان',hasNotification: false,),
          SliverToBoxAdapter(
            child: Column(
              children:
              [
                const SpaceWidget(height: 16,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.5.w),
                  child: CheckoutProgressBar(
                    payWithCash: orderEntity.payWithCash,
                    currentScreenIndex: 1,
                  ),
                ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.w),
                 child: ValueListenableBuilder(
                   valueListenable: formValidationMode,
                   builder: (context, value, child) {
                     LoggerService().logDebug('Rebuild The Form Widget only');
                     return  Form(
                       key: formKey,
                       autovalidateMode: value,
                       child: Column(
                         children:
                         [
                           const SpaceWidget(height: 24,),
                           NameField(
                             onSaved: (value)
                             {
                               name=value;
                             },
                           ),
                           const SpaceWidget(height: 8,),
                           EmailField(
                             onSaved: (value)
                             {
                               email=value;
                             },
                           ),
                           const SpaceWidget(height: 8,),
                           AddressField(
                             onSaved: (value)
                             {
                               address=value;
                             },
                           ),
                           const SpaceWidget(height: 8,),
                           CityField(
                             onSaved: (value)
                             {
                               city=value;
                             },
                           ),
                           const SpaceWidget(height: 8,),
                           FloorNumberField(
                             onSaved: (value)
                             {
                               floor=value;
                             },
                           ),
                           const SpaceWidget(height: 8,),
                           PhoneFiled(
                             onSaved: (value)
                             {
                               phone=value;
                             },
                           ),
                           SaveAddressSwitch(),
                           const SpaceWidget(height: 64,),
                           SharedButton(btnText: 'التالي', onPressedBtn: (){
                             if(formKey.currentState!.validate())
                             {
                               formKey.currentState?.save();
                               var orderEntity2 = orderEntity.copyWith(shippingAddress: ShippingAddressEntity(
                                 name: name,
                                 email: email,
                                 city: city,
                                 addressDetails: address,
                                 floorNum: floor,
                                 phone:phone,
                               ));
                               LoggerService().logDebug('Order Entity value : ${orderEntity2.shippingAddress.phone}');
                               _handleNavigationLogic(orderEntity2, context);
                             }
                             else
                             {
                               formValidationMode.value=AutovalidateMode.always;
                             }
                           })


                         ],
                       ),
                     );
                   }
                 ),
                 ),



              ],
            ),
          )

        ],
      ),
    );
  }

  void _handleNavigationLogic(OrderEntity orderEntity2, BuildContext context)
  {
     if(orderEntity2.payWithCash==true)
      {
        navigate(route: Routes.paymentRevisionScreen, context: context,
        args: orderEntity2
        );
      }
    else
      {
        navigate(route: Routes.paymentOptionsScreen, context: context,
            args: orderEntity2
        );
      }
  }

}












