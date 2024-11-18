import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/src/core/theme/app_theme_mode.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key, this.backButton = false, required this.appTitle});

  final String appTitle;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: AppThemeMode.current,
        builder: (BuildContext context, bool value, Widget? child) {
          return AppBar(
            leading: backButton
                ? IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ))
                : null,
            title: Text(
              appTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            backgroundColor: value ? Colors.blueAccent : Colors.blueGrey,
            actions: [
              IconButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  AppThemeMode.change();
                },
                icon: Icon(
                  value ? Icons.light_mode : Icons.dark_mode,
                  color: value ? Colors.white : Colors.black87,
                ),
              )
            ],
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
