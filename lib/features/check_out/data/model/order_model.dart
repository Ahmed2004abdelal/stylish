import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../home/data/models/products_model.dart';

import '../../../cart/data/cart_model.dart';
import '../../../profile/data/models/payment_model.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  String? orderId;
  String? deliveryMethod;
  PaymentModel? paymentModel;
  double? totalAmount;
  List<ProductsModel>? cartItems;

  OrderModel({
    required this.paymentModel,
    required this.totalAmount,
    required this.cartItems,
    required this.orderId,
    required this.deliveryMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}
