import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pfartists/auth_gate.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      home: const AuthGate(),
      // initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => const AuthGate(),
      //   '/home': (BuildContext context) => const Home(),
      //   '/login': (BuildContext context) => const Login(),
      //   '/create': (BuildContext context) => const Create(),
      // },
      material: (_, __)  => MaterialAppData(
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(255, 208, 104, 1),
          ),
        ),
        cupertino: (_, __) => CupertinoAppData(
          theme: const CupertinoThemeData(
            scaffoldBackgroundColor: Color.fromRGBO(255, 208, 104, 1),

          ),
        ),
    );
  }
}


