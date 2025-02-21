import 'package:flutter/cupertino.dart';
    // show DefaultCupertinoLocalizations;
import 'package:flutter/material.dart';
    // show
    //     DefaultMaterialLocalizations,
    //     Widget,
    //     BuildContext,
    //     runApp,
    //     WidgetsFlutterBinding,
    //     LocalizationsDelegate,
    //     DefaultWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
    // show ProviderScope, ConsumerWidget, WidgetRef;
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
    // show PlatformProvider, PlatformTheme, PlatformApp, PlatformSettingsData;

import 'package:pfartists_flutter/utils/supabase.dart';
import 'package:pfartists_flutter/constants/environment.dart';
import 'package:pfartists_flutter/constants/providers.dart';

import 'package:pfartists_flutter/modules/MyHome/my_home.dart';
import 'package:pfartists_flutter/modules/Welcome/welcome.dart';

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

    final themeMode = ThemeMode.system;
    final lightTheme = ThemeData.light();
    final darkTheme = ThemeData.dark();

    const lightDefaultCupertinoTheme = CupertinoThemeData(brightness: Brightness.light);

    final cupertinoLightTheme = MaterialBasedCupertinoThemeData(
      materialTheme: lightTheme.copyWith(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.light,
          barBackgroundColor:
          lightDefaultCupertinoTheme.barBackgroundColor,
          textTheme: CupertinoTextThemeData(
            navActionTextStyle: lightDefaultCupertinoTheme
                .textTheme.navActionTextStyle
                .copyWith(color: const Color.fromARGB(255, 28, 31, 40)),
            navLargeTitleTextStyle: lightDefaultCupertinoTheme
                .textTheme.navLargeTitleTextStyle
                .copyWith(color: const Color.fromARGB(255, 28, 31, 40)),
          ),
        ),
      ),
    );
    const darkDefaultCupertinoTheme = CupertinoThemeData(brightness: Brightness.dark);
    final cupertinoDarkTheme = MaterialBasedCupertinoThemeData(
      materialTheme: darkTheme.copyWith(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.dark,
          barBackgroundColor:
          darkDefaultCupertinoTheme.barBackgroundColor,
          textTheme: CupertinoTextThemeData(
            navActionTextStyle: darkDefaultCupertinoTheme
                .textTheme.navActionTextStyle
                .copyWith(color: const Color(0xf7f7f7f7)),
            navLargeTitleTextStyle: darkDefaultCupertinoTheme
                .textTheme.navLargeTitleTextStyle
                .copyWith(color: const Color(0xf7f7f7f7)),
          ),
        ),
      ),
    );

    final materialLightTheme = ThemeData.light();
    final materialDarkTheme = ThemeData.dark();

    return PlatformProvider(
      settings:
          PlatformSettingsData(iosUseZeroPaddingForAppbarPlatformIcon: true),
      builder: (context) => PlatformTheme(
        themeMode: themeMode,
        materialLightTheme: materialLightTheme,
        materialDarkTheme: materialDarkTheme,
        cupertinoLightTheme: cupertinoLightTheme,
        cupertinoDarkTheme: cupertinoDarkTheme,
        builder: (context) => PlatformApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Pfartists',
          home: user ? MyHome() : Welcome(),
        ),
      ),
    );
  }
}
