import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pfartists_flutter/constants/environment.dart';
// import 'package:pfartists_flutter/modules/MyHome/MyHome.dart';
import 'package:pfartists_flutter/modules/Welcome/Welcome.dart';
import 'package:pfartists_flutter/utils/supabase.dart';

Future<void> main() async {
initializeEnvironment();
  await supabaseClient();


  runApp(
    ProviderScope( // Otaczamy aplikację ProviderScope
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Aplikacja Cupertino z Riverpod',
      home: Welcome(),
    );
  
  }
}