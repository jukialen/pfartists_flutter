import 'package:flutter/cupertino.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen(
      {Key? key,
      required this.title,
      required this.padding})
      : super(key: key);

  final String title;
  final EdgeInsets padding;

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Text(
        widget.title,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}
