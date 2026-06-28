// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      pinCode: json['pinCode'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      accountHolderName: json['accountHolderName'] as String?,
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'pinCode': instance.pinCode,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
      'country': instance.country,
      'bankAccountNumber': instance.bankAccountNumber,
      'accountHolderName': instance.accountHolderName,
    };
