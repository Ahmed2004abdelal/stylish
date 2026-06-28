import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel {
  final String? pinCode;
  final String? address;
  final String? phoneNumber;
  final String? city;
  final String? country;
  final String? bankAccountNumber;
  final String? accountHolderName;

  PaymentModel(
      {this.pinCode,
      this.address,
      this.phoneNumber,
      this.city,
      this.country,
      this.bankAccountNumber,
      this.accountHolderName});

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
