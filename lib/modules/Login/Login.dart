import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, StateProvider, WidgetRef;

final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

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
              onChanged: (value) => ref.read(emailProvider.notifier).state = value,
            ),
            SizedBox(height: 16),
            CupertinoTextField(
              placeholder: 'Password',
              obscureText: true,
              onChanged: (value) => ref.read(passwordProvider.notifier).state = value,
            ),
            SizedBox(height: 16),
            CupertinoButton.filled(
              child: Text('Login'),
              onPressed: () {
                // Handle login logic
              },
            ),
            SizedBox(height: 16),
            CupertinoButton(
              child: Text('Login with Google'),
              onPressed: () {
                // Handle Google login logic
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
                // Handle Spotify login logic
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