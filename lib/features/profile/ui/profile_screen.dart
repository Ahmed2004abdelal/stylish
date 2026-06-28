import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/theme/style.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController pinCodeController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController countryController;
  late TextEditingController phoneController;
  late TextEditingController bankAccountNumberController;
  late TextEditingController accountHolderNameController;

  @override
  initState() {
    super.initState();
    _formKey = context.read<ProfileCubit>().formKey;
    pinCodeController = context.read<ProfileCubit>().pinCodeController;
    addressController = context.read<ProfileCubit>().addressController;
    cityController = context.read<ProfileCubit>().cityController;
    countryController = context.read<ProfileCubit>().countryController;
    phoneController = context.read<ProfileCubit>().phoneController;
    bankAccountNumberController =
        context.read<ProfileCubit>().bankAccountNumberController;
    accountHolderNameController =
        context.read<ProfileCubit>().accountHolderNameController;
  }

  // @override
  // dispose() {
  //   _formKey.currentState?.dispose();
  //   pinCodeController.dispose();
  //   addressController.dispose();
  //   cityController.dispose();
  //   countryController.dispose();
  //   bankAccountNumberController.dispose();
  //   accountHolderNameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            //! edit this key
            key: _formKey,
            child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 22.w, vertical: 23.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text("MY Profile",
                              style: AppTextStyles.font18SemiBoldBlack)),
                      verticalSpace(20),
                      ProfileImage(),
                      verticalSpace(30),
                      Text(
                        'Business Address Details',
                        style: AppTextStyles.font16SemiBoldBlack,
                      ),
                      verticalSpace(15),
                      ProfileBlocBuilder(
                        phoneController: phoneController,
                        pinCodeController: pinCodeController,
                        addressController: addressController,
                        cityController: cityController,
                        countryController: countryController,
                        bankAccountNumberController:
                            bankAccountNumberController,
                        accountHolderNameController:
                            accountHolderNameController,
                      ),
                      verticalSpace(10),
                      CustomButton(
                          text: "save",
                          onPressed: () {
                            validateAndSave(context);
                          }),
                      PaymentBlocListener(),
                      ProfileGetBlockListener(),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

void validateAndSave(BuildContext context) {
  final cubit = context.read<ProfileCubit>();
  // final formKey = context.read<ProfileCubit>().formKey;
  if (cubit.formKey.currentState!.validate()) {
    cubit.updateProfile();
  }
}

class PaymentBlocListener extends StatelessWidget {
  const PaymentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is Saving || current is Saved || current is SavingError,
      listener: (context, State) {
        State.maybeWhen(
            saving: () => CircularProgressIndicator(),
            saved: (message) =>
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    message,
                    style: AppTextStyles.font14SemiBoldWhite,
                  ),
                  backgroundColor: Colors.green,
                )),
            saveError: (error) =>
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    error,
                    style: AppTextStyles.font14SemiBoldWhite,
                  ),
                  backgroundColor: Colors.red,
                )),
            orElse: () => SizedBox.shrink());
      },
      child: SizedBox.shrink(),
    );
  }
}

class BankAccountDetails extends StatelessWidget {
  const BankAccountDetails({
    super.key,
    required this.bankAccountNumberController,
    required this.accountHolderNameController,
  });

  final TextEditingController bankAccountNumberController;
  final TextEditingController accountHolderNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        Text("Bank Account Details", style: AppTextStyles.font16SemiBoldBlack),
        verticalSpace(15),
        CustomTextForm(
            // isObscureText: true,
            controller: bankAccountNumberController,
            validatorChecker: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your bank account number';
              }
              return null;
            },
            labelText: 'Bank Account Number'),
        verticalSpace(10),
        CustomTextForm(
            controller: accountHolderNameController,
            validatorChecker: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter account holder name';
              }
              return null;
            },
            labelText: 'Account Holder Name')
      ],
    );
  }
}

class BusinessAddressDetails extends StatelessWidget {
  const BusinessAddressDetails({
    super.key,
    required this.pinCodeController,
    required this.addressController,
    required this.cityController,
    required this.countryController,
    required this.phoneController,
  });

  final TextEditingController pinCodeController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        CustomTextForm(
            controller: pinCodeController,
            labelText: 'pincode',
            validatorChecker: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your pincode';
              }
              return null;
            }),
        // verticalSpace(10),
        CustomTextForm(
            controller: addressController,
            labelText: 'Address',
            validatorChecker: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            }),
        // verticalSpace(10),
        CustomTextForm(
            controller: cityController,
            labelText: 'City',
            validatorChecker: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            }),
        // verticalSpace(10),
        CustomTextForm(
            controller: countryController,
            labelText: 'Country',
            validatorChecker: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your country';
              }
              return null;
            }),
        CustomTextForm(
            controller: phoneController,
            labelText: 'Phone Number',
            validatorChecker: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            }),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 48,
            child: Image.asset('assets/images/profile-placeholder.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 16),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileBlocBuilder extends StatelessWidget {
  final TextEditingController pinCodeController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController phoneController;
  final TextEditingController bankAccountNumberController;
  final TextEditingController accountHolderNameController;

  const ProfileBlocBuilder(
      {super.key,
      required this.pinCodeController,
      required this.addressController,
      required this.cityController,
      required this.countryController,
      required this.phoneController,
      required this.bankAccountNumberController,
      required this.accountHolderNameController});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BusinessAddressDetails(
        pinCodeController: pinCodeController,
        addressController: addressController,
        cityController: cityController,
        countryController: countryController,
        phoneController: phoneController,
      ),
      verticalSpace(20),
      Divider(
        color: Colors.grey.withAlpha(100),
        height: 2.h,
      ),
      BankAccountDetails(
          bankAccountNumberController: bankAccountNumberController,
          accountHolderNameController: accountHolderNameController),
    ]);
  }
}

class ProfileGetBlockListener extends StatelessWidget {
  const ProfileGetBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (prev, curr) =>
          curr is Success || curr is Failure || curr is Loading,
      listener: (context, state) {
        state.maybeWhen(
          loading: () => CircularProgressIndicator(),
          failure: (error) =>
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              error,
              style: AppTextStyles.font14SemiBoldWhite,
            ),
            backgroundColor: Colors.red,
          )),
          success: (payments) {},
          orElse: () {},
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
