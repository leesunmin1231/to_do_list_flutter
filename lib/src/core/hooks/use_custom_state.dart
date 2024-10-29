import 'package:flutter_hooks/flutter_hooks.dart';

List<dynamic> useCustomState(initialState) {
  final customState = useState(initialState);

  void setCustomState(newState) {
    customState.value = newState;
  }

  return [customState.value, setCustomState];
}
