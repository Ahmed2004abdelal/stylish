import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'show_deal_of_the_day_products.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/style.dart';
import '../../../data/models/products_model.dart';

class ShowProducts extends StatelessWidget {
  final int index;
  const ShowProducts({
    super.key,
    required this.index,
    required this.products,
  });

  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 250.h,
      // margin: const EdgeInsets.only(right: 16.0),
      margin: const EdgeInsets.only(right: 16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: AppColors.pink,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(8.0),
                color: AppColors.whiteTextField,
              ),
              child: Center(
                child: Image.network(
                    // height: 40.h,
                    width: 240.w,
                    fit: BoxFit.cover,
                    products[index].image),
              ),
            ),
            verticalSpace(8),
            Padding(
              padding: EdgeInsets.only(
                left: 5.0.w,
                right: 5.0.w,
                bottom: 10.h,
                // vertical: 10.h
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    products[index].name,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: AppTextStyles
                        .font12MediumBlack,
                  ),
                  verticalSpace(4),
                  Text(
                    products[index].description,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    style: AppTextStyles
                        .font10RegularBlack,
                  ),
                  verticalSpace(4),
                  Text(
                    products[index]
                        .salePrice
                        .toString(),
                    style: AppTextStyles
                        .font12MediumBlack,
                  ),
                  verticalSpace(4),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: products[index]
                          .price
                          .toString(),
                      style: AppTextStyles
                          .font12MediumBlackGrey
                          .copyWith(
                              decoration:
                                  TextDecoration
                                      .lineThrough),
                    ),
                    TextSpan(
                      text:
                          '  \$${products[index].discountPercentage}%Off',
                      style: AppTextStyles
                          .font12LightBlackGrey
                          .copyWith(
                              color: Colors
                                  .redAccent),
                    ),
                  ])),
                  verticalSpace(6),
                  //!Rating bar
                  RatingBar(
                      products: products[index])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}