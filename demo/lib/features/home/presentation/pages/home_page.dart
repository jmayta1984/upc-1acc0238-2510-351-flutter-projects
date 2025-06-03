import 'package:demo/core/ui/custom_text_field.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/views/banner_view.dart';
import 'package:demo/features/home/presentation/views/shoe_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Shoe> shoes = [
    Shoe(
      id: 1,
      name: "Adidas Samba",
      category: "Running",
      gender: "Men",
      price: 200,
      image:
          "https://wowconcept.com/cdn/shop/files/ADO2SNE01037LEW_Grey_0_cbb1300e-e3a4-4e17-b3c1-c9b052bdc3d5.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(icon: Icon(Icons.search), hintText: "Search"),
        BannerView(),
        Expanded(child: ShoeListView(shoes: shoes)),
      ],
    );
  }
}
