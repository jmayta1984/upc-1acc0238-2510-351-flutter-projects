import 'package:flutter/material.dart';
import 'package:mynasainsights/data/nasa_image_service.dart';
import 'package:mynasainsights/domain/nasa_image.dart';

class SearchNasaImagePage extends StatefulWidget {
  const SearchNasaImagePage({super.key});

  @override
  State<SearchNasaImagePage> createState() => _SearchNasaImagePageState();
}

class _SearchNasaImagePageState extends State<SearchNasaImagePage> {
  List<NasaImage> _images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search NASA Images',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (query) async {
            // Here you would typically call a service to fetch images
            // For demonstration, we will use a mock list
            List<NasaImage> images = await NasaImageService().searchNasaImages(
              query,
            );
            setState(() {
              _images = images;
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (context, index) {
              final image = _images[index];
              return ListTile(
                title: Text(image.title),
                subtitle: Text(image.description),
              );
            },
          ),
        ),
      ],
    );
  }
}
