class Music {
  final String id;
  final String title;
  final String artist;
  final String? album;
  final String filePath;
  final Duration duration;
  final String? coverUrl;

  Music({
    required this.id,
    required this.title,
    required this.artist,
    this.album,
    required this.filePath,
    required this.duration,
    this.coverUrl,
  });

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      artist: map['artist'] ?? '',
      album: map['album'],
      filePath: map['filePath'] ?? '',
      duration: Duration(seconds: map['duration'] ?? 0),
      coverUrl: map['coverUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'filePath': filePath,
      'duration': duration.inSeconds,
      'coverUrl': coverUrl,
    };
  }
}