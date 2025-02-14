import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
    static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
    static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
}

Future<void> initializeEnvironment() async {
    await dotenv.load(fileName: ".env");
}