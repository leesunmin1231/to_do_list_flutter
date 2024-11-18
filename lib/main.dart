import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_list/src/configs/app_router.dart';
import 'package:to_do_list/src/core/theme/app_theme_data.dart';
import 'package:to_do_list/src/core/theme/app_theme_mode.dart';

void main() {
  AppThemeMode.instance;
  runApp(
    // Provider가 동작할 수 있도록 앱의 가장 최상위 부모 위젯을 ProviderScope로 감싸줍니다.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: AppThemeMode.themeMode,
        builder: (context, mode, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            darkTheme: AppThemeData.dark,
            theme: AppThemeData.light,
            themeMode: mode,
            routerConfig: router,
          );
        });
  }
}
