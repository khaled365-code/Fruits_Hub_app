 part of 'signup_cubit.dart';

@immutable
final class SignupState extends Equatable
{

 final RequestStates requestState;
 final UserEntity? userEntity;
 final String? errorMessage;
 final AutovalidateMode validateMode;
 final bool termsAndConditionsActive;


 const SignupState({this.requestState=RequestStates.initial,this.userEntity,this.errorMessage,this.validateMode=AutovalidateMode.disabled,this.termsAndConditionsActive=false});

 @override
 List<Object?> get props => [requestState,userEntity,errorMessage,validateMode,termsAndConditionsActive];


  SignupState copyWith({RequestStates? requestState,UserEntity? userEntity,String? errorMessage,AutovalidateMode? validateMode,bool? termsAndConditionsActive})
 {
   return SignupState(
       termsAndConditionsActive: termsAndConditionsActive??this.termsAndConditionsActive,
       validateMode: validateMode??this.validateMode,
       requestState: requestState??this.requestState,
       userEntity: userEntity??this.userEntity,
       errorMessage: errorMessage??this.errorMessage);
 }


}

