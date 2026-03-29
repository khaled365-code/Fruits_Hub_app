




import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';

class PaypalShippingAddressModel
{

  final String recipientName;
  final String line1;
  final String line2;
  final String city;
  final String countryCode;
  final String postalCode;
  final String phone;
  final String state;

  PaypalShippingAddressModel({
    required this.recipientName,
    required this.line1,
    required this.line2,
    required this.city,
    required this.countryCode,
    required this.postalCode,
    required this.phone,
    required this.state});


  factory PaypalShippingAddressModel.fromShippingAddressEntity({required ShippingAddressEntity shippingAddressEntity})
  {
    return PaypalShippingAddressModel(
        recipientName: shippingAddressEntity.name!,
        line1: shippingAddressEntity.addressDetails!,
        line2: "",
        city: shippingAddressEntity.city!,
        countryCode: AppConstants.temporaryCountryCode,
        postalCode: AppConstants.temporaryPostalCode,
        phone: shippingAddressEntity.phone!,
        state: shippingAddressEntity.city!);
  }

   toJson()=> {
        BackendEndPoints.recipientName:recipientName,
        BackendEndPoints.line1:line1,
        BackendEndPoints.line2:line2,
        BackendEndPoints.city:city,
        BackendEndPoints.countryCode:countryCode,
        BackendEndPoints.postalCode:postalCode,
        BackendEndPoints.phone:phone,
        BackendEndPoints.state:state,
       };

}