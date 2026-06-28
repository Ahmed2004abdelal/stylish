// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      brand: json['brand'] as String,
      categoryId: json['categoryId'] as String,
      description: json['description'] as String,
      discountPercentage: (json['discountPercentage'] as num).toInt(),
      id: json['id'] as String,
      image: json['image'] as String,
      inStock: json['inStock'] as bool,
      isDealOfTheDay: json['isDealOfTheDay'] as bool,
      isNewArrival: json['isNewArrival'] as bool,
      isSponsored: json['isSponsored'] as bool,
      isTrending: json['isTrending'] as bool,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      salePrice: (json['salePrice'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'discountPercentage': instance.discountPercentage,
      'id': instance.id,
      'image': instance.image,
      'inStock': instance.inStock,
      'isDealOfTheDay': instance.isDealOfTheDay,
      'isNewArrival': instance.isNewArrival,
      'isSponsored': instance.isSponsored,
      'isTrending': instance.isTrending,
      'name': instance.name,
      'price': instance.price,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'salePrice': instance.salePrice,
      'quantity': instance.quantity,
    };
