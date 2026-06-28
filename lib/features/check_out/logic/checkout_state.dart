import 'package:freezed_annotation/freezed_annotation.dart';
import '../../profile/data/models/payment_model.dart';

part 'checkout_state.freezed.dart';

// في checkout_state.dart
@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;
  const factory CheckoutState.addressLoaded(List<PaymentModel> data) = _AddressLoaded; 
  const factory CheckoutState.selected(String method) = _Selected;
  const factory CheckoutState.successGet(String message) = _SuccessGet;
  const factory CheckoutState.successSet(String message) = _SuccessSet;
  const factory CheckoutState.failure(String error) = _Failure;

  /// payment states
  const factory CheckoutState.makingPayment() = _MakingPayment;
  const factory CheckoutState.paymentSuccess() = _PaymentSuccess;
  const factory CheckoutState.paymentFailure(String error) = _PaymentFailure;
}