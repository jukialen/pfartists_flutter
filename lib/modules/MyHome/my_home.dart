import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pfartists_flutter/modules/Home/home.dart';
import 'package:pfartists_flutter/modules/Profile/profile.dart';
import 'package:pfartists_flutter/modules/Search/search.dart';
// import 'providers.dart';

// Provider przechowujący wybrany indeks zakładki
final selectedIndexProvider = StateProvider<int>((ref) => 0);


class MyHome extends ConsumerWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Dom',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Szukaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => Home(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => Search(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => ProfilePage(),
            );
          default:
            return Container();
        }
      },
    );
  }
}
