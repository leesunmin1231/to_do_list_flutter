import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar(this.appTitle, {super.key});

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          appTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
