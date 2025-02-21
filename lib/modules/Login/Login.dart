import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:pfartists_flutter/constants/providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pfartists_flutter/utils/supabase.dart';

import 'package:pfartists_flutter/modules/ForgottenPassword/forgotten_password.dart';
import 'package:pfartists_flutter/modules/Create/create.dart';

import 'package:pfartists_flutter/shared/ProvidersOptions/providers_options.dart';

final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final errorLogin = StateProvider<bool>((ref) => false);

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(
          'Login',
          style: TextStyle(color: Color.fromARGB(255, 28, 31, 40)),
        ),
        leading: PlatformIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          materialIcon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 28, 31, 40),
          ),
          cupertinoIcon: Icon(
            CupertinoIcons.arrow_left,
            size: 28.0,
          ),
        ),
        // trailingActions: <Widget>[
        //   PlatformIconButton(),
        // ],
        backgroundColor: Color(0xFFFFD068),
      ),
      body: LoginBody(),
      // bottomNavBar: PlatformNavBar(),
      iosContentPadding: false,
      iosContentBottomPadding: false,
    );
  }
}

class LoginBody extends ConsumerWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    Future<void> login() async {
      if (kDebugMode) {
        print('email, $email');
        print('password, $password');
      }

      if (email.isNotEmpty || password.isNotEmpty) {
        ref.read(errorLogin.notifier).state = true;
        final AuthResponse data = await supabase.auth
            .signInWithPassword(email: email, password: password);
        final User? user = data.user;
        ref.read(errorLogin.notifier).state = user == null;
        ref.read(userProvider.notifier).state = user != null;
      }
    }

    return Container(
      color: Color(0xFFFFD068),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlatformTextFormField(
                hintText: 'Email',
                onChanged: (value) =>
                ref.read(emailProvider.notifier).state = value,
              ),
              PlatformTextFormField(
                hintText: 'Password',
                obscureText: true,
                onChanged: (value) =>
                ref.read(passwordProvider.notifier).state = value,
              ),
              PlatformElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  login();
                },
              ),
              if (ref.watch(errorLogin)) Text('Invalid email or password'),
              ProvidersOptions(),
              PlatformElevatedButton(
                child: Text('Forgotten a password?'),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ForgottenPassword()),
                  );
                },
              ),
              PlatformElevatedButton(
                child: Text('Registration'),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Create()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
