class Artwork {
  final String id;
  final String title;
  final String imageUrl;
  final String artistTitle;
  final String dateDisplay;
  final String description;
  final String placeOfOrigin;
  final String mediumDisplay;
  final String dimensions;
  final String creditLine;

  Artwork({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.artistTitle,
    required this.dateDisplay,
    required this.description,
    required this.placeOfOrigin,
    required this.mediumDisplay,
    required this.dimensions,
    required this.creditLine,
  });

  factory Artwork.fromJson(Map<String, dynamic> json) {
    // Build the IIIF image URL
    final imageUrl = _generateImageUrl(json['id'].toString());

    return Artwork(
      id: json['id'].toString(),
      title: json['title'] ?? 'No Title',
      imageUrl: imageUrl,
      artistTitle: json['artist_title'] ?? 'Unknown Artist',
      dateDisplay: json['date_display'] ?? 'Unknown Date',
      description: json['description'] ?? '',
      placeOfOrigin: json['place_of_origin'] ?? 'Unknown Place',
      mediumDisplay: json['medium_display'] ?? 'Unknown Medium',
      dimensions: json['dimensions'] ?? 'Unknown Dimensions',
      creditLine: json['credit_line'] ?? 'Unknown Credit',
    );
  }

  // Method to generate the IIIF image URL
  static String _generateImageUrl(String artworkId) {
    return 'https://www.artic.edu/iiif/2/$artworkId/full/843,/0/default.jpg';
  }
}
