// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:pfartists_flutter/modules/Login/Login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text('Nazwa Aplikacji'),
      // ),
      child: SafeArea(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,            
            children: [
              Column(
                children: [
                  Text(
                    'Nazwa Aplikacji',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Witamy artystów! Ciesz się tworzeniem i dziel się swoją sztuką.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Icon(CupertinoIcons.brightness),
                    onPressed: () {
                      // Implement dark mode toggle
                    },
                  ),
                  CupertinoButton(
                    child: Icon(CupertinoIcons.arrow_right),
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
      ),
      ),
    );
  }
}