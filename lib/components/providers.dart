import 'package:flutter/material.dart';

class Providers extends StatefulWidget {
  const Providers({Key? key, required this.title, required this.icon}) : super(key: key);

  final String title;
  final Widget icon;
  @override
  _ProvidersState createState() => _ProvidersState();
}

class _ProvidersState extends State<Providers> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              side: const BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                  style: BorderStyle.solid),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text('Logowanie przez Google'),
                      content: Text('Kliknięto'),
                    );
                  });
            },
            icon: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: widget.icon
            ),
            label: Text(widget.title,
                style: const TextStyle(fontSize: 22)),
          ),
        ));
  }
}