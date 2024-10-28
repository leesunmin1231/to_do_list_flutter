# Riverpod
## Install
### pubspeck.yaml의 dependencies에 추가
```bash
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```

### lint 설치
```bash
flutter pub add dev:riverpod_lint
```

설치 후 아래와 같이 yaml에 추가해주어야 함
```yaml
analyzer:
  plugins:
    - custom_lint
```

### 모듈 설치
```bash
flutter pub get
```

## riverpod_generator 실행
- `dart run build_runner watch` 명령문은 riverpod_generator가 코드 생성기를 실행하여 riverpod_annotation이 적용될 수 있도록 도와줍니다.
```bash
dart run build_runner watch
```