# To do list

This is a Flutter toy project for study purposes.

The following packages were used:

- riverpod
- flutter_hooks
- go_router

You can check the package versions in the pubspec.yaml file.

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
       * [todolist_input_widget.dart](lib/src/features/todolist/widget/todolist_input_widget.dart)
       * [todolist_widget.dart](lib/src/features/todolist/widget/todolist_widget.dart)
     * [store](lib/src/store)
         * [todolist](lib/src/store/todolist)
             * [todolist_notifier.dart](lib/src/store/todolist/todolist_notifier.dart)


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
