import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<void> printAllCache() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    print('\n=== CACHED DATA ===');
    for (String key in keys) {
      print('$key: ${prefs.get(key)}');
    }
    print('==================\n');
  }
  
  static Future<void> clearAllCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('Cache cleared!');
  }
} 