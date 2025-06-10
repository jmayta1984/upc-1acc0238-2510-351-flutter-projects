import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:flutter/material.dart';

class FavoriteShoeCardView extends StatelessWidget {
  const FavoriteShoeCardView({super.key, required this.shoe});
  final FavoriteShoe shoe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(width: 130, height: 110, child: Image.network(shoe.image)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$ ${shoe.price}'),
              Text(shoe.name, style: TextStyle(fontWeight: FontWeight.bold)),
              OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sizes',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
                child: Text('Add to cart'),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Options',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: ListTile(title: Text('Add to cart'))),
                           GestureDetector(
                            onTap: (){},
                            child: ListTile(title: Text('Remove from favorites'))),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
