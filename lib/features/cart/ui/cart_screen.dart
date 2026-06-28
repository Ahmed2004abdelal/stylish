import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/style.dart';
import '../logic/cart_cubit.dart';
import '../logic/cart_state.dart';
import '../../home/data/models/products_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        state.maybeWhen(
          cartItemRemoved: (_) => context.read<CartCubit>().fetchCartItems(),
          cartItemRemoveError: (message) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message))),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            child: Column(
              children: [
                Text("MY Cart", style: AppTextStyles.font20SemiBoldBlack),
                verticalSpace(20),
                const MyCartBlocBuilder(),
                // ✅ Total + Checkout في الأسفل
                const CartSummary(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCartBlocBuilder extends StatelessWidget {
  const MyCartBlocBuilder({super.key});

  Widget _buildCartItem(BuildContext context, ProductsModel item, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey[300],
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(item.image, fit: BoxFit.cover),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font12MediumBlack,
                ),
                verticalSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceAndQuantity(index: index),
                    QuantityControl(index: index),
                    RemoveButton(productId: item.id),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
          cartLoading: () => const Center(child: CircularProgressIndicator()),
          cartError: (message) => Text(message),
          cartItemRemoving: () {
            final items = context.read<CartCubit>().cartItems;
            return Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Opacity(
                      opacity: 0.5,
                      child: _buildCartItem(context, items[index], index),
                    ),
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
          cartLoaded: (data) {
            if (data.isEmpty) {
              return const Center(child: Text("Cart is empty"));
            }
            return Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    _buildCartItem(context, data[index], index),
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
          cartLoaded: (items) {
            if (items.isEmpty) return const SizedBox();

            final double total = items.fold(
              0,
              (sum, item) => sum + (item.salePrice * item.quantity),
            );

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // ✅ سطر الـ Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total (${items.length} items)",
                        style: AppTextStyles.font14SemiBoldWhite.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: AppTextStyles.font20SemiBoldBlack,
                      ),
                    ],
                  ),
                  verticalSpace(12),
                  // ✅ زرار الـ Checkout
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(Routes.checkout, arguments: {
                          'cartItems': context.read<CartCubit>().cartItems,
                          'total': total,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        "Checkout  •  \$${total.toStringAsFixed(2)}",
                        style: AppTextStyles.font14SemiBoldWhite,
                      ),
                    ),
                  ),
                  verticalSpace(30)
                ],
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class QuantityControl extends StatelessWidget {
  final int index;

  const QuantityControl({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Row(
      children: [
        IconButton(
          onPressed: () => cubit.addQuantity(index),
          icon: const Icon(Icons.add),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              cartLoaded: (items) => Text(
                "${items[index].quantity}",
                style: AppTextStyles.font16SemiBoldBlack,
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
        IconButton(
          onPressed: () => cubit.removeQuantity(index),
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

class PriceAndQuantity extends StatelessWidget {
  final int index;

  const PriceAndQuantity({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
          cartLoaded: (items) {
            final item = items[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${item.salePrice.toStringAsFixed(1)}",
                  style: AppTextStyles.font10RegularBlack,
                ),
                Text(
                  "qty: ${item.quantity}",
                  style: AppTextStyles.font10RegularBlack,
                ),
              ],
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class RemoveButton extends StatelessWidget {
  final String productId;

  const RemoveButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CartCubit>().removeFromCart(productId),
      child: Container(
        height: 30.h,
        width: 80.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Text(
          "Remove",
          style: AppTextStyles.font14SemiBoldWhite,
        ),
      ),
    );
  }
}
