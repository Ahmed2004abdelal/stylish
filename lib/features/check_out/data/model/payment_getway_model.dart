import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_getway_model.g.dart';

@JsonSerializable()
class PaymentGetwayModel {
  int? amount;
  String? currency;

  PaymentGetwayModel({this.amount, this.currency});

  factory PaymentGetwayModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentGetwayModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGetwayModelToJson(this);
}