import 'package:musik_app/domain/entities/music.dart';
import 'package:musik_app/domain/repositories/music_repository.dart';

class GetPlaybackHistory {
  final MusicRepository repository;

  GetPlaybackHistory(this.repository);

  Future<List<Music>> call() async {
    return await repository.getPlaybackHistory();
  }
}