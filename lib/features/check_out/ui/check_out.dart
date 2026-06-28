import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/theme/style.dart';
import '../../../core/widgets/custom_button.dart';
import '../data/model/order_model.dart';
import '../logic/checkout_cubit.dart';
import '../logic/checkout_state.dart';
import '../../profile/data/models/payment_model.dart';

import '../../../core/widgets/custom_text_form.dart';

class CheckOut extends StatefulWidget {
  final Map<String, dynamic> cartItems;
  CheckOut({required this.cartItems, super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // final checkoutCubit = context.read<CheckoutCubit>();
  late GlobalKey<FormState> _formKey;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController streetAddressController;
  late TextEditingController pinCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    _formKey = context.read<CheckoutCubit>().formKey;
    countryController = context.read<CheckoutCubit>().countryController;
    cityController = context.read<CheckoutCubit>().cityController;
    streetAddressController =
        context.read<CheckoutCubit>().streetAddressController;
    pinCodeController = context.read<CheckoutCubit>().pinCodeController;
    phoneNumberController = context.read<CheckoutCubit>().phoneNumberController;
  }

  @override
  Widget build(BuildContext context) {
    // Future<List<PaymentModel>> address = SharedPrefHelper.getJsonList<PaymentModel>(_paymentsCacheKey);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shadowColor: Colors.grey[200],
          elevation: 0.1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Check Out', style: AppTextStyles.font16SemiBoldBlack),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsetsGeometry.symmetric(horizontal: 22.w, vertical: 16.h),
            child: Form(
              key: _formKey,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DeliveryText(),
                    verticalSpace(8),
                    CustomTextForm(
                      hintText: "Country",
                      controller: countryController,
                      validatorChecker: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your country';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8),
                    CustomTextForm(
                      hintText: "City",
                      controller: cityController,
                      validatorChecker: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8),
                    CustomTextForm(
                      hintText: "Street Address",
                      controller: streetAddressController,
                      validatorChecker: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your street address';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8),
                    CustomTextForm(
                      keyboardType: TextInputType.number,
                      hintText: "Pin Code",
                      controller: pinCodeController,
                      validatorChecker: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your pin code';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(8),
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: countryController,
                      builder: (context, value, child) {
                        return CustomTextForm(
                          keyboardType: TextInputType.number,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w, vertical: 12.0.h),
                            child: Text(
                              context
                                  .read<CheckoutCubit>()
                                  .countryFlag(value.text),
                              style: AppTextStyles.font12MediumBlack,
                            ),
                          ),
                          hintText: "Phone Number",
                          controller: phoneNumberController,
                          validatorChecker: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    verticalSpace(16),
                    totalAmountAndItemsCount(cartItems: widget.cartItems),
                    verticalSpace(16),
                    Text(
                      "Delivery Method",
                      style: AppTextStyles.font14SemiBoldBlack,
                    ),
                    verticalSpace(16),
                    DeliveryMethod(
                        checkoutCubit: context.read<CheckoutCubit>()),
                    verticalSpace(20),
                    ContinueButton(
                        formKey: _formKey,
                        streetAddressController: streetAddressController,
                        cityController: cityController,
                        countryController: countryController,
                        phoneNumberController: phoneNumberController,
                        pinCodeController: pinCodeController,
                        cartItems: widget.cartItems,
                        checkoutCubit: context.read<CheckoutCubit>()),
                    CheckoutBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}

class DeliveryMethod extends StatelessWidget {
  const DeliveryMethod({
    super.key,
    required this.checkoutCubit,
  });

  final CheckoutCubit checkoutCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        checkoutCubit.deliveryMethodsImage.length,
        (index) {
          Map<String, String> method =
              context.watch<CheckoutCubit>().deliveryMethodsImage[index];
          return GestureDetector(
            onTap: () {
              checkoutCubit.selectDeliveryMethod(method['method']!);
            },
            child: Container(
              // margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.all(8.0.w),
              decoration: BoxDecoration(
                color: checkoutCubit.selectedDeliveryMethod == method['method']
                    ? Colors.blue[100]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color:
                      checkoutCubit.selectedDeliveryMethod == method['method']
                          ? Colors.blue
                          : Colors.grey[400]!,
                ),
              ),
              child: deliveryMethodImage(method['imagePath']!),
            ),
          );
        },
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.streetAddressController,
    required this.cityController,
    required this.countryController,
    required this.phoneNumberController,
    required this.pinCodeController,
    required this.cartItems,
    required this.checkoutCubit,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController streetAddressController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController phoneNumberController;
  final TextEditingController pinCodeController;
  final Map<String, dynamic> cartItems;
  final CheckoutCubit checkoutCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        // (1) لازم return للنتيجة
        return state.maybeWhen(
          // (2) وقت التحميل اعرض spinner
          loading: () => const Center(child: CircularProgressIndicator()),
          // (3) أي حالة تانية اعرض الزرار العادي
          orElse: () => CustomButton(
            text: "Continue",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<CheckoutCubit>().setAddress(
                      PaymentModel(
                        address: streetAddressController.text,
                        city: cityController.text,
                        country: countryController.text,
                        phoneNumber: phoneNumberController.text,
                        pinCode: pinCodeController.text,
                      ),
                      OrderModel(
                        cartItems: cartItems['cartItems'],
                        deliveryMethod: checkoutCubit.selectedDeliveryMethod,
                        orderId: DateTime.now().toString(),
                        paymentModel: PaymentModel(
                          address: streetAddressController.text,
                          city: cityController.text,
                          country: countryController.text,
                          phoneNumber: phoneNumberController.text,
                          pinCode: pinCodeController.text,
                        ),
                        totalAmount: cartItems['total'],
                      ),
                      cartItems['total']
                    );
              }
            },
          ),
        );
      },
    );
  }
}

class DeliveryText extends StatelessWidget {
  const DeliveryText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.grey[600]),
        horizontalSpace(4),
        Text(
          "Delivery Address",
          style: AppTextStyles.font14SemiBoldBlack,
        ),
      ],
    );
  }
}

class CheckoutBlocListener extends StatelessWidget {
  const CheckoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          state.maybeWhen(
              orElse: () => null,
              successSet: (message) =>
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.green,
                    ),
                  ),
              failure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error)),
                );
              });
        },
        child: SizedBox.shrink());
  }
}

class totalAmountAndItemsCount extends StatelessWidget {
  final Map<String, dynamic> cartItems;
  const totalAmountAndItemsCount({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total (${cartItems['cartItems'].length} items)",
          style: AppTextStyles.font14SemiBoldWhite.copyWith(
            color: Colors.grey[600],
          ),
        ),
        Text(
          "\$ ${cartItems['total'].toStringAsFixed(2)}",
          style: AppTextStyles.font20SemiBoldBlack,
        ),
      ],
    );
  }
}

Widget deliveryMethodImage(String imagePath) {
  return Container(
    child: Image.asset(
      imagePath,
      width: 100.w,
      height: 100.h,
    ),
  );
}
