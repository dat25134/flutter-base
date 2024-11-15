import '../config/env_config.dart';

class ApiEndpoints {
  static final String baseUrl = EnvConfig.apiBaseUrl;
  
  // Auth endpoints
  static String get login => '$baseUrl/login';
  static String get logout => '$baseUrl/logout';

  // Profile endpoints
  static String get profile => '$baseUrl/profile';
} 