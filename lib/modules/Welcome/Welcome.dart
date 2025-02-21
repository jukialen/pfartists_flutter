import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:pfartists_flutter/modules/Login/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: WelcomeBoydy(),
      iosContentPadding: false,
      iosContentBottomPadding: false,
    );
  }
}

class WelcomeBoydy extends StatelessWidget {
  const WelcomeBoydy({super.key});

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = PlatformTheme.of(context)!.themeMode;
    void changeMode() {
      PlatformTheme.of(context)!.themeMode = currentThemeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    }

    return Container(
        color: Color(0xFFFFD068),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlatformText(
                        'Pfartists',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 28, 31, 40),
                        ),
                      ),
                      PlatformText(
                        'Witamy artystów! Ciesz się tworzeniem i dziel się swoją sztuką.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 28, 31, 40),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlatformIconButton(
                      onPressed: changeMode,
                      materialIcon: Icon(
                          currentThemeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
                        color: Color.fromARGB(255, 151, 179, 255),
                      ),
                      cupertinoIcon: Icon(
                        currentThemeMode == ThemeMode.light ? CupertinoIcons.moon_fill : CupertinoIcons.brightness,
                        color: Color.fromARGB(255, 151, 179, 255),
                      ),
                    ),
                    PlatformIconButton(
                      materialIcon: Icon(
                        Icons.arrow_forward,
                        color: Color.fromARGB(255, 151, 179, 255),
                      ),
                      cupertinoIcon: Icon(
                        CupertinoIcons.arrow_right,
                        color: Color.fromARGB(255, 151, 179, 255)
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
