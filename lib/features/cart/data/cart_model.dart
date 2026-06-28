
import 'package:json_annotation/json_annotation.dart';
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final double? price;
  final double? size;
  final int? quantity;
  final double? rating;



  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.rating, 
    required this.description, 
    required this.size,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}