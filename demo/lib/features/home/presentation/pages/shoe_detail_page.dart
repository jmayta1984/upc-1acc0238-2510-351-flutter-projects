import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_state.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeDetailPage extends StatefulWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  int _selectedSizeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final Shoe shoe = widget.shoe;
    final List<ShoeSize> sizes = shoe.sizes;

    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {},
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Hero(
                          tag: widget.shoe.id,
                          child: Image.network(
                            widget.shoe.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 60,
                      child: IconButton(
                        onPressed: () {
                          context.read<ShoeBloc>().add(
                            ToggleShoeEvent(shoe: shoe),
                          );
                        },
                        icon: BlocBuilder<ShoeBloc, ShoeState>(
                          builder: (context, state) {
                            if (state is LoadedShoeState) {
                              final isFavorite = state.shoes
                                  .where((e) => e.id == shoe.id)
                                  .first
                                  .isFavorite;
                              return Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              );
                            }
                            return Icon(Icons.favorite_border);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.shoe.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$ ${widget.shoe.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                Text(widget.shoe.description),
                SizedBox(height: 8),

                Text(
                  'Size',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (context, index) {
                      final size = sizes[index];
                      final isSelected = _selectedSizeIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSizeIndex = index;
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? ColorPalette.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                size.size,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_selectedSizeIndex >= 0)
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: Text('Stock: ${sizes[_selectedSizeIndex].stock}'),
                  ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: ColorPalette.primary,
              ),
              onPressed: (_selectedSizeIndex >= 0) ? () {} : null,
              child: Text("Add to cart"),
            ),
          ),
        ),
      ),
    );
  }
}
