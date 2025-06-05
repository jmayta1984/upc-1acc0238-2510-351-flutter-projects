import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeRepository {
  const ShoeRepository({required this.shoeService});
  final ShoeService shoeService;

  Future<List<Shoe>> getShoes() async {
    return (await shoeService.getShoes()).map((e) => e.toDomain()).toList();
  }
}
