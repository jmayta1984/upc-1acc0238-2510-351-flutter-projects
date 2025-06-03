import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

class ShoeCardView extends StatelessWidget {
  const ShoeCardView({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: Image.network(shoe.image)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      shoe.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(shoe.category),
                    Text(
                      "\$ ${shoe.price}",
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
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
