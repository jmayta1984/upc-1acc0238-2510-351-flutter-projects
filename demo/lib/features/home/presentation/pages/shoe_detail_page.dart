import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

class ShoeDetailPage extends StatelessWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    final List<String> sizes = [
      '8',
      '9',
      '8',
      '9',
      '8',
      '9',
      '8',
      '9',
      '8',
      '9',
      '8',
      '9',
    ];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: shoe.id,
                child: Image.network(shoe.image, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shoe.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(shoe.brand),
            Text(
              '\$ ${shoe.price}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(
              height: 70,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Center(child: Text(sizes[index])),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
