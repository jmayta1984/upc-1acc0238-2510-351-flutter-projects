import 'package:flutter/material.dart';
import 'package:mynasainsights/presentation/search_nasa_image_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: SearchNasaImagePage())),
    );
  }
}
