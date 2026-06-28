import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class CategoriesModel{
  final String? id;
  final String? name;
  final String? image;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic>? json) {
    return _$CategoriesModelFromJson(json!);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesModelToJson(this);
  }
}