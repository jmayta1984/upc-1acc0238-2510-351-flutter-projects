import 'package:demo/features/favorites/data/datasources/favorite_shoe_dao.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeRepository {
  const ShoeRepository({
    required this.shoeService,
    required this.favoriteShoeDao,
  });
  final ShoeService shoeService;
  final FavoriteShoeDao favoriteShoeDao;

  Future<List<Shoe>> getShoes() async {
    final dtos = await shoeService.getShoes();

    final shoes = await Future.wait(
      dtos.map((e) async {
        final isFavorite = await favoriteShoeDao.isFavorite(e.id);
        final shoe = e.toDomain();
        return shoe.copyWithFavorite(isFavorite);
      }),
    );
    return shoes;
  }
}
