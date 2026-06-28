import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../data/model/order_model.dart';
import '../data/repo/checkout_repo.dart';
import 'checkout_state.dart';
import '../../profile/data/models/payment_model.dart';

import '../../../core/networks/services/payment/stripe_amount_helper.dart';
import '../../../core/networks/services/payment/stripe_services.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo checkoutRepo;
  final StripeServices stripe = StripeServices.instance;
  CheckoutCubit({required this.checkoutRepo}) : super(CheckoutState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String selectedDeliveryMethod = 'FedEX';
  StreamSubscription? _addressSubscription;

  final List<Map<String, String>> deliveryMethodsImage = [
    {'method': 'FedEX', 'imagePath': 'assets/images/feedX.png'},
    {'method': 'DHL', 'imagePath': 'assets/images/DHL.png'},
  ];

  String currencySymbol(String currency) {
    switch (currency.toLowerCase()) {
      case 'egypt':
        return 'egp';
      case 'united states':
        return 'usd';
      case 'canada':
        return 'cad';
      case 'united kingdom':
        return 'gbp';
      default:
        return 'usd';
    }
  }

  int stripeAmount(double amount) {
    return StripeAmountHelper.toStripeAmount(
      amount,
      'usd',
    );
  }

  String countryFlag(String country) {
    switch (country.toLowerCase()) {
      case 'egypt':
        return '🇪🇬 +20';
      case 'united states':
        return '🇺🇸 +1';
      case 'canada':
        return '🇨🇦 +1';
      case 'united kingdom':
        return '🇬🇧 +44';
      default:
        return '🏳️';
    }
  }

  void selectDeliveryMethod(String method) {
    selectedDeliveryMethod = method;
    emit(CheckoutState.selected(method));
  }

  void getAddress() {
    emit(CheckoutState.loading());
    try {
      var _addressSubscription = checkoutRepo.getAddress().listen((data) {
        if (isClosed) return;
        if (data.isNotEmpty) {
          _fillControllers(data[0]);
        }
        emit(CheckoutState.successGet('Address fetched successfully'));
      });
    } catch (e) {
      emit(CheckoutState.failure(e.toString()));
    }
  }

  Future<void> setAddress(
      PaymentModel paymentModel, OrderModel orderModel, double amount) async {
    emit(CheckoutState.loading());
    // await Future.delayed(const Duration(seconds: 10));
    try {
      await stripeMakePayment(amount);
      await checkoutRepo.updateAddress(paymentModel);
      await checkoutRepo.makeOrder(orderModel);
      emit(CheckoutState.successSet('Order placed successfully'));
    } catch (e) {
      debugPrint('Error in setAddress: $e');
      emit(CheckoutState.failure(e.toString()));
    }
  }

  Future<void> stripeMakePayment(double amount) async {
    // final currency = currencySymbol(countryController.text);
    final currency = 'usd';
    final amountInStripeFormat =
        StripeAmountHelper.toStripeAmount(amount, currency);
    await stripe.makePayment(amountInStripeFormat, currency);
  }

  void _fillControllers(PaymentModel model) {
    countryController.text = model.country ?? '';
    cityController.text = model.city ?? '';
    streetAddressController.text = model.address ?? '';
    pinCodeController.text = model.pinCode ?? '';
    phoneNumberController.text = model.phoneNumber ?? '';
  }

  @override
  Future<void> close() {
    countryController.dispose();
    cityController.dispose();
    streetAddressController.dispose();
    pinCodeController.dispose();
    phoneNumberController.dispose();
    _addressSubscription?.cancel();
    return super.close();
  }
}
