import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get environment => dotenv.env['ENVIRONMENT'] ?? 'dev';
  
  static String get apiBaseUrl {
    if (environment == 'prod') {
      return dotenv.env['API_BASE_URL_PROD'] ?? 'https://prod-api.example.com';
    }
    return dotenv.env['API_BASE_URL_DEV'] ?? 'https://dev-api.example.com';
  }
} 