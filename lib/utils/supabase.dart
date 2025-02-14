import 'package:pfartists_flutter/constants/environment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseClient() async {
  await Supabase.initialize(
    url: Environment.supabaseUrl,
    anonKey: Environment.supabaseAnonKey,
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
