class NasaImage {
  final String id;
  final String description;
  final String title;
  final String dateCreated;
  final List<String> keywords;
  final List<NasaImageLink> links;

  const NasaImage({
    required this.id,
    required this.description,
    required this.title,
    required this.dateCreated,
    required this.keywords,
    required this.links,
  });
}

class NasaImageLink {
  final String title;
  final String image;

  const NasaImageLink({required this.title, required this.image});
}
