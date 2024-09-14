import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/ui/screens/auth/register/cubit/register_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterScreenStates> {
  RegisterUseCase? registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(InitialState());

  var userNameController = TextEditingController();
  var userPhoneNoController = TextEditingController();
  var userEmailController = TextEditingController();
  var uesrPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void register() async {
    emit(LoadingState());
    var either = await registerUseCase?.invoke(
        userNameController.text,
        userPhoneNoController.text,
        userEmailController.text,
        uesrPasswordController.text);
    return either?.fold(
      (error) => emit(ErrorState(errorMessage: error.errorMessage)),
      (response) => emit(SuccessState(registerResponseEntitiy: response)),
    );
  }
}
