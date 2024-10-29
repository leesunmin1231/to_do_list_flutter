# flutter_hooks

- hooks은 riverpod과 함께 사용하는 것이 일반적이나, 필수적인 것은 아님.
- hooks은 React에서 온 개념이며, flutter_hooks는 단지 React 구현을 Flutter로 포팅한 것이다.

## 설치하기
```bash
flutter pub add hooks_riverpod
flutter pub add flutter_hooks
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```

## hooks 규칙
**훅은 HookWidget을 extends하는 위젯의 build 메서드 내에서만 사용 가능하다.**
```dart
class Example extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();
    ...
  }
}
```

**이벤트 핸들러 안에서도 사용 불가하다.**
```dart
class Example extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // _실제로_ 'build' 메서드 내부가 아니라 사용자 상호작용 라이프사이클 내부 (여기서는 'onPressed').
        final controller = useAnimationController();
      },
      child: Text('click me'),
    );
  }
}
```

**조건부 또는 루프 안에서 사용할 수 없다.**
```dart
class Example extends HookWidget {
  const Example({required this.condition, super.key});
  final bool condition;
  @override
  Widget build(BuildContext context) {
    if (condition) {
      // 훅(Hooks)은 "if"/"for", ... 안에서 사용할 수 없습니다.
      final controller = useAnimationController();
    }
    ...
  }
}
```

## hooks 사용 방법
### HookConsumerWidget
- hooks_riverpod 패키지에서 HookWidget과 ConsumerWidget을 결합한 HookConsumerWidget 클래스를 제공한다.
```dart
// We extend HookConsumerWidget instead of HookWidget
class Example extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We can use both hooks and providers here
    final counter = useState(0);
    final value = ref.watch(myProvider);

    return Text('Hello $counter $value');
  }
}
```

### 커스텀 hooks
- 여러 훅을 함수 하나에 정의해두고 재사용 할 수 있다.
```dart
double useFadeIn() {
  final animationController = useAnimationController(
    duration: const Duration(seconds: 2),
  );
  useEffect(() {
    animationController.forward();
    return null;
  }, const []);
  useAnimation(animationController);
  return animationController.value;
}

class FadeIn extends HookWidget {
  const FadeIn({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final fade = useFadeIn();

    return Opacity(opacity: fade, child: child);
  }
}
```