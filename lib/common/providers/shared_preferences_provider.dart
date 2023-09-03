import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
);

final sPHandlerProvider = Provider<SPHandler>((ref) {
  final sp = ref.watch(sharedPreferencesProvider);
  return SPHandler(sp);
});

class SPHandler {
  final SharedPreferences _sharedPreferences;

  SPHandler(this._sharedPreferences);

  Future<void> setOnBoardingShowen() async {
    await _sharedPreferences.setBool('on_boarding_shown', true);
  }

  bool hasOnBoardingShowen() => _sharedPreferences.getBool('on_boarding_shown') ?? false;
}
