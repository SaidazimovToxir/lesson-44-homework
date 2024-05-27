import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String title;
  final num price;
  final String description;
  final String imageUrl;
  final Map<String, dynamic> rating;

  CategoryModel({
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }
}
