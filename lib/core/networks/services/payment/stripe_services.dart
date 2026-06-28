import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../features/check_out/data/model/payment_getway_model.dart';
import '../../../utilities/cosntant.dart';

class StripeServices {
  final Stripe stripe = Stripe.instance;
  StripeServices._();
  static final StripeServices instance = StripeServices._();

  // Future<void> makePayment(int amount, String currency) async {
  //   try {
  //     final clientSecret = await _createPaymentIntent(
  //         PaymentGetwayModel(amount: amount, currency: currency));
  //     if (clientSecret == null) return;
  //     await stripe.initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: clientSecret,
  //         merchantDisplayName: 'Stylish',
  //       ),
  //     );
  //     await stripe.presentPaymentSheet();
  //   } catch (e) {
  //     debugPrint('Error in makePayment: $e');
  //     rethrow;
  //   }
  // }

  Future<void> makePayment(int amount, String currency) async {
    try {
      final clientSecret = await _createPaymentIntent(
          PaymentGetwayModel(amount: amount, currency: currency));

      if (clientSecret == null) {
        throw Exception('client_secret is null — تأكد من الـ request/الـ keys');
      }

      await stripe.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Stylish',
        ),
      );

      await stripe.presentPaymentSheet();
    } catch (e) {
      debugPrint('Error in makePayment: $e');
      rethrow;
    }
  }

  // Future<String?> _createPaymentIntent(PaymentGetwayModel paymentModel) async {
  //   try {
  //     final aDio = Dio();
  //     final response = await aDio.post(Constants.paymentIntentPath,
  //         data: paymentModel.toJson(),
  //         options:
  //             Options(contentType: Headers.formUrlEncodedContentType, headers: {
  //           'Authorization': 'Bearer ${Constants.paymentSecretKey}',
  //           'Content-Type': 'application/x-www-form-urlencoded'
  //         }));
  //     return response.data['client_secret'] as String?;
  //   } catch (e) {
  //     debugPrint('Error in _createPaymentIntent: $e');
  //     rethrow;
  //   }
  // }

  Future<String?> _createPaymentIntent(PaymentGetwayModel paymentModel) async {
    try {
      final aDio = Dio();
      final response = await aDio.post(
        Constants.paymentIntentPath,
        data: paymentModel.toJson(),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer ${Constants.paymentSecretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      debugPrint('PaymentIntent status: ${response.statusCode}');
      debugPrint('PaymentIntent response: ${response.data}'); // ← مهم جداً

      return response.data['client_secret'] as String?;
    } catch (e) {
      debugPrint('Error in _createPaymentIntent: $e');
      rethrow;
    }
  }
}
