import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/networks/services/firebase/auth_services.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthServices _authServices;
  LoginCubit(this._authServices) : super(LoginState.loginInitial());
  bool isPasswordVisible = true;
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String userId = _authServices.currentUser?.uid ?? '';

Future<void> emitLoginLoading() async {
  emit(LoginState.loginLoading());

  try {
    final response = await _authServices.loginWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );

    // if (isClosed) return;

    emit(LoginState.loginSuccess());
  } catch (e) {
    // if (isClosed) return;

    emit(LoginState.loginFailure(e.toString()));
  }
}

  //forgot password
Future<void> emitForgotPassword() async {
  emit(LoginState.forgotPasswordLoading());

  try {
    await _authServices.sendPasswordResetEmail(emailController.text);

    // if (isClosed) return;

    emit(LoginState.forgotPasswordSuccess(
      "Password reset email sent successfully",
    ));
  } catch (e) {
    // if (isClosed) return;

    emit(LoginState.forgotPasswordFailure(e.toString()));
  }
}

  //Todo: implement google sign in
  // void emitLoginByGoogle() async {
  //   emit(LoginState.loginLoading());
  //   try {
  //     final response = await _authServices.signUpWithGoogle();
  //     emit(LoginState.loginSuccess(response));
  //   } catch (e) {
  //     emit(LoginState.loginFailure(e.toString()));
  //   }
  // }
}
