import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';

extension ShoeToFavoriteShoe on Shoe {
  FavoriteShoe toFavorite() {
    return FavoriteShoe(id: id, name: name, image: image, price: price);
  }
}
