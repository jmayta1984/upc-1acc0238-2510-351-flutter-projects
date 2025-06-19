import 'package:demo/features/favorites/data/repositories/favorite_shoe_repository.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final _repository = FavoriteShoeRepository();

  FavoriteBloc() : super(FavoriteState(favorites: [])) {
    on<AddFavoriteEvent>((event, emit) async {
      await _repository.insertFavorite(event.favorite);
      await _onGetAll(emit);
    });

    on<RemoveFavoriteEvent>((event, emit) async {
      await _repository.deleteFavorite(event.id);
      await _onGetAll(emit);
    });

    on<GetAllFavoriteEvent>((event, emit) async {
      await _onGetAll(emit);
    });
  }

  Future<void> _onGetAll(Emitter<FavoriteState> emit) async {
    final favorites = await _repository.fetchAll();
    emit(FavoriteState(favorites: favorites));
  }
}
