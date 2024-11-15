class ServerException implements Exception {}
class CacheException implements Exception {}

class ConnectionException implements Exception {
  final String message;
  
  ConnectionException(this.message);
  
  @override
  String toString() => message;
} 