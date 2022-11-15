import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesRepository({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  Future<void> setUser() async {
    _sharedPreferences.setString("user", "true");
  }
}
