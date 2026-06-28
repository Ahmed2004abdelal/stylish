import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  final String brand;
  final String categoryId;
  // final DateTime createdAt;
  final String description;
  final int discountPercentage;
  final String id;
  final String image;
  final bool inStock;
  final bool isDealOfTheDay;
  final bool isNewArrival;
  final bool isSponsored;
  final bool isTrending;
  final String name;
  final int price;
  final double rating;
  final int reviewCount;
  final int salePrice;
  int quantity;

  ProductsModel({
    required this.brand,
    required this.categoryId,
    // required this.createdAt,
    required this.description,
    required this.discountPercentage,
    required this.id,
    required this.image,
    required this.inStock,
    required this.isDealOfTheDay,
    required this.isNewArrival,
    required this.isSponsored,
    required this.isTrending,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.salePrice,
    this.quantity = 1,
  });

  ProductsModel copyWith({
    String? brand,
    String? categoryId,
    String? description,
    int? discountPercentage,
    String? id,
    String? image,
    bool? inStock,
    bool? isDealOfTheDay,
    bool? isNewArrival,
    bool? isSponsored,
    bool? isTrending,
    String? name,
    int? price,
    double? rating,
    int? reviewCount,
    int? salePrice,
    int? quantity,
  }) {
    return ProductsModel(
      brand: brand ?? this.brand,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      id: id ?? this.id,
      image: image ?? this.image,
      inStock: inStock ?? this.inStock,
      isDealOfTheDay: isDealOfTheDay ?? this.isDealOfTheDay,
      isNewArrival: isNewArrival ?? this.isNewArrival,
      isSponsored: isSponsored ?? this.isSponsored,
      isTrending: isTrending ?? this.isTrending,
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      salePrice: salePrice ?? this.salePrice,
      quantity: quantity ?? this.quantity,
    );
  }

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return _$ProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsModelToJson(this);
  }
}
