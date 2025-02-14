import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usernameProvider = StateProvider<String>((ref) => 'jan_kowalski');

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Profil'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nazwa użytkownika: $username'),
            SizedBox(height: 20),
            CupertinoButton(
              child: Text('Zmień nazwę'),
              onPressed: () {
                ref.read(usernameProvider.notifier).state = 'nowa_nazwa';
              },
            ),
          ],
        ),
      ),
    );
  }
}