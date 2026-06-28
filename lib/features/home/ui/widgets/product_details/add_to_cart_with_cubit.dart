import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/style.dart';
import '../../../logic/home/home_cubit.dart';
import '../../../logic/home/home_state.dart';

class AddToCartWihtCubit extends StatelessWidget {
  const AddToCartWihtCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is AddToCartLoading ||
          current is AddToCartSuccess ||
          current is AddToCartError,
      listener: (context, state) {
        state.maybeWhen(
          addToCartLoading: () {
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
          addToCartSuccess: (message) {
            // Hide loading indicator and show success message
            Navigator.of(context).pop(); // Close the loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                    message,
                    style: AppTextStyles.font14RegularBlackGrey,
                  ),
                  backgroundColor: Colors.green),
            );
          },
          addToCartError: (message) {
            debugPrint(message);
            // Hide loading indicator and show error message
            Navigator.of(context).pop(); // Close the loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error: $message',
                  style: AppTextStyles.font14RegularBlackGrey,
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () => null,
        );
      },
      child: Container(),
    );
  }
}
