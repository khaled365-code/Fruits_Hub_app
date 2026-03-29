


import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel
{

 final String name;
 final String email;
 final String addressDetails;
 final String city;
 final String  floorNum;
 final String phone;


 const ShippingAddressModel({
   required this.name,
   required this.email,
   required this.addressDetails,
   required this.city,
   required this.floorNum,
   required this.phone});


 factory ShippingAddressModel.fromEntity(ShippingAddressEntity shippingAddressEntity)
 {
   return ShippingAddressModel(
       name: shippingAddressEntity.name!,
       email: shippingAddressEntity.email!,
       addressDetails: shippingAddressEntity.addressDetails!,
       city: shippingAddressEntity.city!,
       floorNum: shippingAddressEntity.floorNum!,
       phone: shippingAddressEntity.phone!);
 }

 Map<String,dynamic> toMap() => {
   BackendEndPoints.name:name,
   BackendEndPoints.email:email,
   BackendEndPoints.addressDetails:addressDetails,
   BackendEndPoints.city:city,
   BackendEndPoints.floorNum:floorNum,
   BackendEndPoints.phone:phone

 };




}