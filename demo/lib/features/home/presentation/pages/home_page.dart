import 'package:demo/core/ui/custom_text_field.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/data/repositories/shoe_repository.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/widgets/banner_view.dart';
import 'package:demo/features/home/presentation/widgets/shoe_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoe> _shoes = [];
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    List<Shoe> shoes = await ShoeRepository(
      shoeService: ShoeService(),
    ).getShoes();
    setState(() {
      _shoes = shoes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(icon: Icon(Icons.search), hintText: "Search"),
        BannerView(),
        Expanded(child: ShoeListView(shoes: _shoes)),
      ],
    );
  }
}
