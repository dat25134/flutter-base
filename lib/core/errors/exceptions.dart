class ServerException implements Exception {
  final String message;
  
  ServerException([this.message = 'Server error']);
  
  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;
  
  CacheException([this.message = 'Cache error']);
  
  @override
  String toString() => message;
}

class ConnectionException implements Exception {
  final String message;
  
  ConnectionException(this.message);
  
  @override
  String toString() => message;
} 