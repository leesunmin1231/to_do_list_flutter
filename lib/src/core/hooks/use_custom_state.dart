import 'package:flutter_hooks/flutter_hooks.dart';

List<dynamic> useCustomState(initialState) {
  final customState = useState(initialState);

  void setCustomState(newState) {
    customState.value = newState;
    print(customState.value);
  }

  return [customState.value, setCustomState];
}
