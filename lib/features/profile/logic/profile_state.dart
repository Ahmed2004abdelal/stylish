import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/payment_model.dart';
part 'profile_state.freezed.dart';


@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.saving() = Saving;
  const factory ProfileState.saved(String message) = Saved;
  const factory ProfileState.saveError(String error) = SavingError;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(List<PaymentModel> payments) = Success;
  const factory ProfileState.failure(String error) = Failure;
}
