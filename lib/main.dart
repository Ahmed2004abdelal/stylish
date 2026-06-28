import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/utilities/cosntant.dart';

import 'core/di/dependency_injection.dart';
import 'stylish_app.dart';

void main() async {
  await initialSetup();
  await setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const StylishApp());
}

Future<void> initialSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefHelper.init();
  Stripe.publishableKey = Constants.paymentPublishableKey;
}
