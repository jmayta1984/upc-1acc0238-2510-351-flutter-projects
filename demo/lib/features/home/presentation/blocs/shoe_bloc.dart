import 'package:demo/features/favorites/data/datasources/favorite_shoe_dao.dart';
import 'package:demo/features/favorites/data/repositories/favorite_shoe_repository.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/data/repositories/shoe_repository.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/domain/entities/shoe_extensions.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc() : super(InitialShoeState()) {
    on<GetShoesEvent>((event, emit) async {
      emit(LoadingShoeState());
      try {
        final List<Shoe> shoes = await ShoeRepository(
          shoeService: ShoeService(), favoriteShoeDao: FavoriteShoeDao(),
        ).getShoes();

        
        emit(LoadedShoeState(shoes: shoes));
      } catch (e) {
        emit(ErrorShoeState(errorMessage: e.toString()));
      }
    });

    on<ToggleShoeEvent> ((event, emit) {
      if (state is LoadedShoeState) {

        final currentShoes = (state as LoadedShoeState).shoes;

        if (event.shoe.isFavorite) {
          FavoriteShoeRepository().deleteFavorite(event.shoe.id);
        } else {
          FavoriteShoeRepository().insertFavorite(event.shoe.toFavorite());
        }

        final updateShoes = currentShoes.map((shoe) {
          if (event.shoe.id == shoe.id){
            return shoe.copyWithFavorite(isFavorite: !shoe.isFavorite);
          }
          return shoe;
        }).toList();

        emit(LoadedShoeState(shoes: updateShoes));
      }
    },);

  }
}
