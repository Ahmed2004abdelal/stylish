import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../data/models/payment_model.dart';
import '../data/repo/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepoImpl}) : super(ProfileState.initial());

  final ProfileRepoImpl profileRepoImpl;

  List<PaymentModel> payments = [];

  /// =========================
  /// FORM KEY
  /// =========================
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<List<PaymentModel>>? _profileSub;

  /// =========================
  /// CONTROLLERS
  /// =========================
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bankAccountNumberController =
      TextEditingController();
  final TextEditingController accountHolderNameController =
      TextEditingController();

  /// =========================
  /// BUILD MODEL FROM UI
  /// =========================
  PaymentModel _buildPaymentModel() {
    return PaymentModel(
      pinCode: pinCodeController.text.trim(),
      address: addressController.text.trim(),
      city: cityController.text.trim(),
      country: countryController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      bankAccountNumber: bankAccountNumberController.text.trim(),
      accountHolderName: accountHolderNameController.text.trim(),
    );
  }

  /// =========================
  /// UPDATE PROFILE
  /// =========================
  Future<void> updateProfile() async {
    emit(const ProfileState.saving());

    try {
      final data = _buildPaymentModel();

      await profileRepoImpl.updateProfile(data);

      payments = [data];

      emit(const ProfileState.saved('Profile updated successfully'));
    } catch (e) {
      debugPrint('Error updating profile: $e');
      emit(ProfileState.saveError(e.toString()));
    }
  }

  /// =========================
  /// GET PROFILE
  /// =========================
  void getUserInfo() {
    print('🟢 getUserInfo CALLED'); // (1) يتأكد إن الميثود بتتنادى
    emit(const ProfileState.loading());

    _profileSub = profileRepoImpl.getProfileInfo().listen(
      (data) {
        if (isClosed) return;
        payments = data;
        if (data.isNotEmpty) {
          fillControllers(data.first); // ← مهم جداً: املا الحقول هنا
        }
        emit(ProfileState.success(data));
      },
      onError: (e, s) {
        if (!isClosed) emit(ProfileState.failure(e.toString()));
      },
    );
  }

  /// =========================
  /// FILL CONTROLLERS
  /// =========================
  void fillControllers(PaymentModel data) {
    pinCodeController.text = data.pinCode ?? '';
    addressController.text = data.address ?? '';
    cityController.text = data.city ?? '';
    countryController.text = data.country ?? '';
    phoneController.text = data.phoneNumber ?? '';
    bankAccountNumberController.text = data.bankAccountNumber ?? '';
    accountHolderNameController.text = data.accountHolderName ?? '';
  }

  /// =========================
  /// CLEANUP
  /// =========================
  @override
  Future<void> close() {
    _profileSub?.cancel();
    pinCodeController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    phoneController.dispose();
    bankAccountNumberController.dispose();
    accountHolderNameController.dispose();
    return super.close();
  }
}
