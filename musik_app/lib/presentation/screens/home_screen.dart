import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musik_app/core/constants/app_constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildRecommendationSection(),
            _buildPlaybackHistorySection(ref),
            _buildPlaylistSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Rekomendasi Untukmu',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.music_note),
                title: Text('Lagu ${index + 1}'),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPlaybackHistorySection(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Baru Diputar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.history),
              title: Text('Lagu yang diputar ${index + 1}'),
            );
          },
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Lihat Lainnya'),
        ),
      ],
    );
  }

  Widget _buildPlaylistSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Playlist',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final playlistsAsync = ref.watch(playlistsProvider);
            return playlistsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text('Error: $error'),
              data: (playlists) {
                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      final playlist = playlists[index];
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                                image: playlist.coverUrl != null 
                                  ? DecorationImage(
                                      image: NetworkImage(playlist.coverUrl!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              ),
                              child: playlist.coverUrl == null
                                ? const Icon(Icons.music_note, size: 50)
                                : null,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              playlist.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              playlist.artist,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}