class Shoe {
  final int id;
  final String name;
  final String category;
  final String gender;
  final int price;
  final String image;
  final String brand;
  final String description;
  final double rating;
  final List<ShoeSize> sizes;

  Shoe({
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
}

class ShoeSize {
  final String size;
  final int stock;

  ShoeSize({
    required this.size,
    required this.stock,
  });
}
