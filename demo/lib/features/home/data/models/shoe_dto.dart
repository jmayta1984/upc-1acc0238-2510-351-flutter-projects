import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeDto {
  final int id;
  final String name;
  final String category;
  final String gender;
  final int price;
  final String image;
  final String brand;

  ShoeDto({
    required this.id,
    required this.name,
    required this.category,
    required this.gender,
    required this.price,
    required this.image,
required this.brand
  });

  factory ShoeDto.fromJson(Map<String, dynamic> json) {
    return ShoeDto(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      gender: json['gender'] as String,
      price: json['price'] as int,
      image: json['image'] as String,
      brand: json['brand'] as String
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
      brand: brand
    );
  }
}
