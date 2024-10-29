import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/src/core/components/top_bar.dart';

class TododetailPage extends ConsumerWidget {
  const TododetailPage(this.id, {super.key});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        appBar: TopBar(
          appTitle: "To do content",
          backButton: true,
        ),
        body: Center(child: Text('투두 상세를 볼 수 없습니다.')));
  }
}
