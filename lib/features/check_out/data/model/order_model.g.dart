// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      paymentModel: json['paymentModel'] == null
          ? null
          : PaymentModel.fromJson(json['paymentModel'] as Map<String, dynamic>),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderId: json['orderId'] as String?,
      deliveryMethod: json['deliveryMethod'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'deliveryMethod': instance.deliveryMethod,
      'paymentModel': instance.paymentModel?.toJson(),
      'totalAmount': instance.totalAmount,
      'cartItems': instance.cartItems?.map((e) => e.toJson()).toList(),
    };
