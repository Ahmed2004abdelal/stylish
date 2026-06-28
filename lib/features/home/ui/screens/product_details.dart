import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/style.dart';
import '../../logic/home/home_cubit.dart';
import '../../logic/home/home_state.dart';
import '../widgets/product_details/add_to_cart_with_cubit.dart';
import '../widgets/product_details/product_price_info.dart';
import '../widgets/product_details/product_slider.dart';
import '../widgets/home_screen/show_deal_of_the_day_products.dart';
import '../widgets/product_details/size_selection.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/products_model.dart';
import '../widgets/product_details/bottom_buttons.dart';

class ProductDetails extends StatelessWidget {
  final ProductsModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSlider(
                images: [product.image, product.image, product.image]),
            verticalSpace(16),
            Text(
              "Size: ${context.read<HomeCubit>().sizes[context.read<HomeCubit>().selectedSize]}",
              style: AppTextStyles.font14SemiBoldBlack,
            ),
            verticalSpace(12),
            //! sized widget refactor
            SizeSelection(),
            verticalSpace(16),
            Text(product.name, style: AppTextStyles.font20SemiBoldBlack),
            verticalSpace(8),
            Text("Brand: ${product.brand}",
                style: AppTextStyles.font14RegularBlackGrey),
            verticalSpace(8),
            RatingBar(products: product),
            verticalSpace(8),
            ProductPriceInfo(product: product),
            verticalSpace(10),
            Text(
              "Product Details",
              style: AppTextStyles.font14MediumBlack,
            ),
            verticalSpace(8),
            Text("${product.description}",
                style: AppTextStyles.font14RegularBlackGrey),
            BottomButtons(product: product),
            AddToCartWihtCubit(),
          ],
        ),
      ),
    );
  }
}
