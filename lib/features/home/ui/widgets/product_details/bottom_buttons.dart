import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/style.dart';
import '../../../logic/home/home_cubit.dart';
import '../../../logic/home/home_state.dart';
import 'custom_details_button.dart';
import 'product_slider.dart';
import '../home_screen/show_deal_of_the_day_products.dart';

import '../../../data/models/products_model.dart';
import '../../screens/product_details.dart';


class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.product,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // horizontalSpace(20),
        CustomDetailsButton(
            ontap: () {
              context.read<HomeCubit>().addToCart(product);
            },
            gradientOne: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
            gradientTwo: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
            icon: const Icon(Icons.shopping_cart_outlined,
                color: Colors.white, size: 25),
            text: 'Go to cart'),
        CustomDetailsButton(
            ontap: () {},
            gradientOne: [
              Color.fromARGB(255, 4, 196, 68),
              Color.fromARGB(255, 4, 178, 18)
            ],
            gradientTwo: [
              Color.fromARGB(255, 5, 167, 59),
              Color.fromARGB(255, 3, 172, 113)
            ],
            icon: const Icon(Icons.monetization_on,
                color: Colors.white, size: 25),
            text: 'Buy Now'),
      ],
    );
  }
}