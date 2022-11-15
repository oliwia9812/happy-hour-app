abstract class BaseAuthenticationRepository {
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<void> signIn({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<void> resetPassword({
    required String email,
  });
}
