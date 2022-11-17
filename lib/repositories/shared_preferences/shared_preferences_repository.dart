import 'package:happy_hour_app/repositories/shared_preferences/base_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository implements BaseSharedPreferences {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesRepository({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<void> setUserIsLogged({required bool isLoggedIn}) async {
    await _sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  }

  @override
  bool? getUserIsLoggedIn() {
    return _sharedPreferences.getBool('isLoggedIn');
  }
}
