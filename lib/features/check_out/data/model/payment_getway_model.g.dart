// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_getway_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentGetwayModel _$PaymentGetwayModelFromJson(Map<String, dynamic> json) =>
    PaymentGetwayModel(
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$PaymentGetwayModelToJson(PaymentGetwayModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };
