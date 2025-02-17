import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pfartists_flutter/constants/environment.dart';
import 'package:pfartists_flutter/constants/providers.dart';

import 'package:pfartists_flutter/utils/supabase.dart';

import 'package:pfartists_flutter/modules/MyHome/my_home.dart';
import 'package:pfartists_flutter/modules/Welcome/Welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeEnvironment();
  await supabaseClient();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return CupertinoApp(
      title: 'Pfartists',
      home: user ? MyHome() : Welcome(),
    );
  }
}
