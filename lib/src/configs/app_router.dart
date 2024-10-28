import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_list/src/features/tododetail/pages/tododetail_page.dart';
import 'package:to_do_list/src/features/todolist/pages/todolist_page.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    initialLocation: '/todolist',
    routes: [
      GoRoute(
        path: '/todolist',
        builder: (_, __) => const TodoListPage(),
      ),
      GoRoute(
        path: '/tododetail',
        builder: (_, state) =>
            TododetailPage(int.parse(state.uri.queryParameters['id']!)),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
