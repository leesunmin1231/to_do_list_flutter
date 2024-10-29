# To do list

This is a Flutter toy project for study purposes.

The following packages were used:

- riverpod
- flutter_hooks
- go_router

You can check the package versions in the pubspec.yaml file.

## Branch
### todo
Implement todo app with plain flutter.
Manage the todo list status as a local status.

## todo_with_riverpod
Implement todo app with riverpod.
Manage the todo list status as a global status.

## todo_with_hooks
Implement todo app with hooks.
Manage the todo list status as a local status.
Use `useState` method when store todo list state.
You can check `useState` code in `useCustomState` custom hook.

## Project Tree

### Flutter study docs (docs folder)
 * [hooks.md](docs/hooks.md)
 * [riverpod.md](docs/riverpod.md)


### To do list code (lib folder)
 * [main.dart](lib/main.dart)
 * [src](lib/src)
     * [configs](lib/src/configs)
       * [app_router.dart](lib/src/configs/app_router.dart)
     * [core](lib/src/core)
       * [components](lib/src/core/components)
         * [top_bar.dart](lib/src/core/components/top_bar.dart)
       * [constants](lib/src/core/constants)
       * [hooks](lib/src/core/hooks)
         * [use_custom_state.dart](lib/src/core/hooks/use_custom_state.dart)
       * [theme](lib/src/core/theme)
         * [app_theme.dart](lib/src/core/theme/app_theme.dart)
       * [utils](lib/src/core/utils)
     * [features](lib/src/features)
         * [tododetail](lib/src/features/tododetail)
           * [pages](lib/src/features/tododetail/pages)
           * [tododetail_page.dart](lib/src/features/tododetail/pages/tododetail_page.dart)
         * [todolist](lib/src/features/todolist)
             * [pages](lib/src/features/todolist/pages)
               * [todolist_page.dart](lib/src/features/todolist/pages/todolist_page.dart)
             * [widget](lib/src/features/todolist/widget)
                 * [todolist_container_widget.dart](lib/src/features/todolist/widget/todolist_container_widget.dart)


## Set Up

- Clone Project
- Install modules

```bash
flutter pub get
```

- Run Flutter

```bash
flutter run
```
