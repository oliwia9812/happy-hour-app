abstract class BaseSharedPreferences {
  bool? getUserIsLoggedIn();
  Future<void> setUserIsLogged({required bool isLoggedIn});
}
