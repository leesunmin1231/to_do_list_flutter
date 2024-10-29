import 'package:flutter_hooks/flutter_hooks.dart';

List<dynamic> useCustomState<T>(initialState) {
  final customState = useState<T>(initialState);

  void setCustomState(T newState) {
    customState.value = newState;
  }

  return [customState.value, setCustomState];
}
