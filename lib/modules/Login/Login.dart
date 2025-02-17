import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, StateProvider, WidgetRef;
import 'package:pfartists_flutter/constants/providers.dart';
import 'package:pfartists_flutter/utils/login_with_google.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:pfartists_flutter/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final errorLogin = StateProvider<bool>((ref) => false);

class Login extends ConsumerWidget {
  const Login({super.key});

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

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              placeholder: 'Email',
              onChanged: (value) =>
                  ref.read(emailProvider.notifier).state = value,
            ),
            SizedBox(height: 16),
            CupertinoTextField(
              placeholder: 'Password',
              obscureText: true,
              onChanged: (value) =>
                  ref.read(passwordProvider.notifier).state = value,
            ),
            SizedBox(height: 16),
            CupertinoButton.filled(
              child: Text('Login'),
              onPressed: () {
                login();
              },
            ),
            SizedBox(height: 16),
            if (ref.watch(errorLogin)) Text('Invalid email or password'),
            CupertinoButton(
              child: Text('Login with Google'),
              onPressed: () async {
                googleUser();
              },
            ),
            CupertinoButton(
              child: Text('Login with Discord'),
              onPressed: () {
                // Handle Discord login logic
              },
            ),
            CupertinoButton(
              child: Text('Login with Spotify'),
              onPressed: () {
// () async {await supabase.auth.signInWithOAuth(
//   OAuthProvider.spotify,
//   authScreenLaunchMode: LaunchMode.inAppWebView,
// );}
              },
            ),
            SizedBox(height: 16),
            CupertinoButton(
              child: Text('Forgotten a password?'),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ForgottenPassword()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Forgotten Password'),
      ),
      child: Center(
        child: Text('Forgotten Password Page'),
      ),
    );
  }
}
