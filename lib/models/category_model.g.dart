// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      title: json['title'] as String,
      price: json['price'] as num,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: json['rating'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'rating': instance.rating,
    };
