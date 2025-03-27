import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musik_app/core/constants/app_constants.dart';
import 'package:musik_app/presentation/screens/add_music_screen.dart';
import 'package:musik_app/presentation/screens/home_screen.dart';
import 'package:musik_app/presentation/screens/profile_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainLayout(),
    ),
  ],
);

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            HomeScreen(),
            AddMusicScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => ref.read(currentIndexProvider.notifier).state = index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(AppConstants.bottomNavIcons[0]),
              label: AppConstants.bottomNavLabels[0],
            ),
            BottomNavigationBarItem(
              icon: Icon(AppConstants.bottomNavIcons[1]),
              label: AppConstants.bottomNavLabels[1],
            ),
            BottomNavigationBarItem(
              icon: Icon(AppConstants.bottomNavIcons[2]),
              label: AppConstants.bottomNavLabels[2],
            ),
          ],
        ),
      ),
    );
  }
}
