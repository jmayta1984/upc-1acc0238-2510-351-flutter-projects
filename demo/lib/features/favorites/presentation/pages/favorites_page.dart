import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/widgets/favorite_shoe_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final List<FavoriteShoe> favoriteShoes = [
    FavoriteShoe(
      id: 1,
      name: 'Nike Air Max',
      image:
          'https://www.fit2run.com/cdn/shop/files/DH5392-007-PHSRH001-1500.png',
      price: 120,
    ),
    FavoriteShoe(
      id: 2,
      name: 'Adidas Ultraboost',
      image:
          'https://www.fit2run.com/cdn/shop/files/DH5392-007-PHSRH001-1500.png',
      price: 180,
    ),
    FavoriteShoe(
      id: 3,
      name: 'Puma RS-X',
      image:
          'https://www.fit2run.com/cdn/shop/files/DH5392-007-PHSRH001-1500.png',
      price: 110,
    ),
    FavoriteShoe(
      id: 4,
      name: 'Reebok Classic',
      image:
          'https://www.fit2run.com/cdn/shop/files/DH5392-007-PHSRH001-1500.png',
      price: 90,
    ),
    FavoriteShoe(
      id: 5,
      name: 'New Balance 574',
      image:
          'https://www.fit2run.com/cdn/shop/files/DH5392-007-PHSRH001-1500.png',
      price: 100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FavoriteShoeListView(favoriteShoes: favoriteShoes));
  }
}
