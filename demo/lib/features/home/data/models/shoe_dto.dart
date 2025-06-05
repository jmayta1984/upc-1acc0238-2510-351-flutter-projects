import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeDto {
  final int id;
  final String name;
  final String category;
  final String gender;
  final int price;
  final String image;
  final String brand;
  final String description;
  final double rating;
  final List<ShoeSizeDto> sizes;

  ShoeDto({
    required this.id,
    required this.name,
    required this.category,
    required this.gender,
    required this.price,
    required this.image,
    required this.brand,
    required this.description,
    required this.rating,
    required this.sizes,
  });

  factory ShoeDto.fromJson(Map<String, dynamic> json) {
    return ShoeDto(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      gender: json['gender'] as String,
      price: json['price'] as int,
      image: json['image'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      sizes: (json['sizes_available'] as List)
          .map((size) => ShoeSizeDto.fromJson(size as Map<String, dynamic>))
          .toList(),
    );
  }

  Shoe toDomain() {
    return Shoe(
      id: id,
      name: name,
      category: category,
      gender: gender,
      price: price,
      image: image,
      brand: brand,
      description: description,
      rating: rating,
      sizes: sizes.map((size) => size.toDomain()).toList(),
    );
  }
}

class ShoeSizeDto {
  final double size;
  final int stock;

  ShoeSizeDto({
    required this.size,
    required this.stock,
  });

  factory ShoeSizeDto.fromJson(Map<String, dynamic> json) {
    return ShoeSizeDto(
      size: (json['size'] as num).toDouble(),
      stock: json['quantity'] as int,
    );
  }

  ShoeSize toDomain() {
    return ShoeSize(
      size: size.toString(),
      stock: stock,
    );
  }
  
}
