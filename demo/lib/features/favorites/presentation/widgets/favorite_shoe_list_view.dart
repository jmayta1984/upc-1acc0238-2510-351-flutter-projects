import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/widgets/favorite_shoe_card_view.dart';
import 'package:flutter/material.dart';

class FavoriteShoeListView extends StatelessWidget {
  const FavoriteShoeListView({super.key, required this.favoriteShoes});
  final List<FavoriteShoe> favoriteShoes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final FavoriteShoe shoe = favoriteShoes[index];
        return FavoriteShoeCardView(shoe: shoe);
      },
      itemCount: favoriteShoes.length,
    );
  }
}
