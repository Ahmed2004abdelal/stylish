import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/style.dart';
import '../../../logic/home/home_cubit.dart';
import '../../../logic/home/home_state.dart';
import 'product_slider.dart';
import '../home_screen/show_deal_of_the_day_products.dart';

import '../../../data/models/products_model.dart';
import '../../screens/product_details.dart';


class ProductPriceInfo extends StatelessWidget {
  const ProductPriceInfo({
    super.key,
    required this.product,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${product.price}\$",
          style: AppTextStyles.font14RegularWhiteGrey.copyWith(
              decoration: TextDecoration.lineThrough, fontSize: 16.sp),
        ),
        horizontalSpace(10),
        Text("${product.salePrice}\$",
            style: AppTextStyles.font14SemiBoldBlack.copyWith(fontSize: 17.sp)),
        horizontalSpace(10),
        Text("${product.discountPercentage}% off",
            style: AppTextStyles.font14SemiBoldRed.copyWith(fontSize: 17.sp)),
      ],
    );
  }
}
