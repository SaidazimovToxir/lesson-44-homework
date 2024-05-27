// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      inStock: json['inStock'] as bool,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'inStock': instance.inStock,
    };
