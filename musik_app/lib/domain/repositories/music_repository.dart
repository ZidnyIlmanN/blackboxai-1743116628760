import 'package:musik_app/domain/entities/music.dart';

abstract class MusicRepository {
  Future<List<Music>> getRecommendedMusic();
  Future<List<Music>> getPlaybackHistory(); 
  Future<List<Music>> getPlaylists();
  Future<void> addMusic(Music music);
  Future<void> saveMusicToLocal(Music music);
}