import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesRepository({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  Future<void> setUserIsLogged({required bool isLoggedIn}) async {
    await _sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  }

  bool? getUserIsLoggedIn() {
    return _sharedPreferences.getBool('isLoggedIn');
  }
}
