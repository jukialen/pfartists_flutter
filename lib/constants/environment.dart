import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get googleWebId => dotenv.env['GOOGLE_ID']!;
  static String get googleAndroidId => dotenv.env['GOOGLE_ANDROID_ID']!;
  static String get googleIOSId => dotenv.env['GOOGLE_IOS_ID']!;
}

Future<void> initializeEnvironment() async {
  await dotenv.load(fileName: ".env");
}
