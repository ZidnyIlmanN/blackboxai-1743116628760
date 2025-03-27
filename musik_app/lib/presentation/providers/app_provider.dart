import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk bottom navigation
final currentIndexProvider = StateProvider<int>((ref) => 0);

// Provider untuk theme mode
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Provider untuk daftar musik
final musicListProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);

// Provider untuk riwayat pemutaran
final playbackHistoryProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);