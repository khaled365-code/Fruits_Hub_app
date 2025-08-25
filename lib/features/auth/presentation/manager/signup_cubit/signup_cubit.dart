import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupState());

  final AuthRepo authRepo;




  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> signupFormKey=GlobalKey();

  void changeTermsAndConditions()
  {
    emit(state.copyWith(termsAndConditionsActive: !state.termsAndConditionsActive));
  }


  activateValidateMode()
  {
    emit(state.copyWith(validateMode: AutovalidateMode.always));
  }

  createUserWithEmailAndPassword({required String email,required String password,required String name}) async
  {
    emit(state.copyWith(requestState: RequestStates.loading));
    var response = await authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);
    response.fold((failure) =>
        emit(state.copyWith(errorMessage: failure.callBack,requestState: RequestStates.error)),
          (userEntity) => emit(state.copyWith(userEntity: userEntity,requestState: RequestStates.success),),);


  }


}
