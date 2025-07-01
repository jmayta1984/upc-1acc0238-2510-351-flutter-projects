import 'package:mynasainsights/domain/nasa_image.dart';

class NasaImageDto {
  final NasaImageDataDto data;
  final List<NasaImageLinkDto> links;

  const NasaImageDto({required this.data, required this.links});

  factory NasaImageDto.fromJson(Map<String, dynamic> json) {
    return NasaImageDto(
      data: NasaImageDataDto.fromJson(json['data']),
      links: (json['links'] as List)
          .map(
            (link) => NasaImageLinkDto.fromJson(link),
          )
          .toList(),
    );
  }

  NasaImage toDomain() {
    return NasaImage(
      id: data.nasaId,
      description: data.description,
      title: data.title,
      dateCreated: data.dateCreated,
      keywords: data.keywords,
      links: links.map((link) => link.toDomain()).toList(),
    );
  }
}

class NasaImageDataDto {
  final String center;
  final String dateCreated;
  final String description;
  final List<String> keywords;
  final String mediaType;
  final String nasaId;
  final String title;

  const NasaImageDataDto({
    required this.center,
    required this.dateCreated,
    required this.description,
    required this.keywords,
    required this.mediaType,
    required this.nasaId,
    required this.title,
  });

  factory NasaImageDataDto.fromJson(Map<String, dynamic> json) {
    return NasaImageDataDto(
      center: json['center'] as String,
      dateCreated: json['date_created'] as String,
      description: json['description'] as String,
      keywords: List<String>.from(json['keywords'] ?? []),
      mediaType: json['media_type'] as String,
      nasaId: json['nasa_id'] as String,
      title: json['title'] as String,
    );
  }
}

class NasaImageLinkDto {
  final String image;
  final String name;

  const NasaImageLinkDto({required this.image, required this.name});

  factory NasaImageLinkDto.fromJson(Map<String, dynamic> json) {
    return NasaImageLinkDto(
      image: json['href'] as String,
      name: json['rel'] as String,
    );
  }

  NasaImageLink toDomain() {
    return NasaImageLink(title: name, image: image);
  }
}
