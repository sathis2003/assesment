class MusicService {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final String backgroundImagePath;
  MusicService({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.backgroundImagePath,
  });

  factory MusicService.fromMap(Map<String, dynamic> map, String id) {
    return MusicService(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      iconPath: map['iconPath'] ?? '',
      backgroundImagePath: map['backgroundImagePath'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'iconPath': iconPath,
      'backgroundImagePath': backgroundImagePath,
    };
  }
}
