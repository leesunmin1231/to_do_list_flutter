import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key, this.backButton = false, required this.appTitle});

  final String appTitle;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
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
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
