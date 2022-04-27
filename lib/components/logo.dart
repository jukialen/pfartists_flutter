import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: Image.asset(
            'assets/PfA.png',
            width: 100,
            height: 100,
            semanticLabel: 'PfA',
          ),
        ));
  }
}
