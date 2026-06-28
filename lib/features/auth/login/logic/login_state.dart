import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.loginInitial() = _LoginInitial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess() = LoginSuccess;
  const factory LoginState.loginFailure(String message) = LoginFailure;

  //forgot password states
  const factory LoginState.forgotPasswordLoading() = ForgotPasswordLoading;
  const factory LoginState.forgotPasswordSuccess(T data) = ForgotPasswordSuccess<T>;
  const factory LoginState.forgotPasswordFailure(String message) = ForgotPasswordFailure;
}


