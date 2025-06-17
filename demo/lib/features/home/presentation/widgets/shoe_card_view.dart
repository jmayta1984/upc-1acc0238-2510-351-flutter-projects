import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/domain/entities/shoe_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeCardView extends StatefulWidget {
  const ShoeCardView({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ShoeCardView> createState() => _ShoeCardViewState();
}

class _ShoeCardViewState extends State<ShoeCardView> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isFavorite = widget.shoe.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: widget.shoe.id,
                    child: Image.network(widget.shoe.image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.shoe.name,
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.shoe.category),
                    Text(
                      "\$ ${widget.shoe.price}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  if (_isFavorite) {
                    context.read<FavoriteBloc>().add(
                      AddFavoriteEvent(favorite: widget.shoe.toFavorite()),
                    );
                  } else {
                    context.read<FavoriteBloc>().add(
                      RemoveFavoriteEvent(id: widget.shoe.id),
                    );
                  }
                },
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
