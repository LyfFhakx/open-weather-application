abstract class TokenRepository {
  Future<String?> readTokenFromSecureStorage(String key);

  Future<void> writeTokenToSecureStorage(String key, String value);

  Future<void> deleteTokenFromSecureStorage(String key);
}
