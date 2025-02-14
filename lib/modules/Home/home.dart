import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Strona główna'),
      ),
      child: Center(
        child: Text('Witaj na stronie głównej!'),
      ),
    );
  }
}