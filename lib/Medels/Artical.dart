class Artincal {


  // Model to restruct our data for easier way to code
  String title;
  String description;
  String urlToImage;

  Artincal(
      {required this.description,
      required this.title,
      required this.urlToImage});

  factory Artincal.fromJson(Map map) {
    return Artincal(
        description: map['description'] ?? 'null',
        title: map['title'] ?? 'null',
        urlToImage: map['urlToImage'] ?? 'null');
  }
}
