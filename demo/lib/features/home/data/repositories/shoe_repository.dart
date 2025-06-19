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
    final favoriteDtos = await favoriteShoeDao.fetchAll();
    final ids = favoriteDtos.map((dto) => dto.id).toList();

    final shoes = dtos
        .map((dto) => dto.toDomain(isFavorite: ids.contains(dto.id)))
        .toList();
    return shoes;
  }
}
