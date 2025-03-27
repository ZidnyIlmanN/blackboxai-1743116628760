import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musik_app/data/repositories/music_repository_impl.dart';
import 'package:musik_app/domain/entities/music.dart';
import 'package:musik_app/domain/usecases/get_recommended_music.dart';
import 'package:musik_app/domain/usecases/get_playback_history.dart';
import 'package:musik_app/domain/usecases/get_playlists.dart';

final musicRepositoryProvider = Provider((ref) => MusicRepositoryImpl());

final recommendedMusicProvider = FutureProvider<List<Music>>((ref) {
  final getRecommendedMusic = GetRecommendedMusic(ref.read(musicRepositoryProvider));
  return getRecommendedMusic();
});

final playbackHistoryProvider = FutureProvider<List<Music>>((ref) {
  final getPlaybackHistory = GetPlaybackHistory(ref.read(musicRepositoryProvider));
  return getPlaybackHistory();
});

final playlistsProvider = FutureProvider<List<Music>>((ref) {
  final getPlaylists = GetPlaylists(ref.read(musicRepositoryProvider));
  return getPlaylists();
});