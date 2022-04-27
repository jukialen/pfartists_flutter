import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterfire_ui/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Home',
      color: const Color.fromARGB(33, 33, 33, 1),
      home: MyHomePage(title: 'Home', user: user!),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.user})
      : super(key: key);

  final User user;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          backgroundColor: const Color.fromRGBO(255, 199, 79, 1),
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1), fontSize: 25),
          ),
        ),
        backgroundColor: const Color.fromARGB(43, 143, 161, 1),
        body: CustomCard(user: widget.user),
        bottomNavBar: PlatformNavBar(
          backgroundColor: const Color.fromRGBO(79, 141, 255, 1),
          items: [
            BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(33, 33, 33, 1),
              icon: Icon(
                PlatformIcons(context).home,
                color: Colors.black,
                size: 25,
              ),
              label: 'Home',
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(PlatformIcons(context).groupSolid,
                  color: Colors.black, size: 25),
              label: 'Groups',
              tooltip: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(PlatformIcons(context).addCircledSolid,
                  color: Colors.black, size: 25),
              label: 'Add a file',
              tooltip: 'Add a file',
            ),
            BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).settings,
                    color: Colors.black, size: 25),
                label: 'Settings',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).settings,
                    color: Colors.black, size: 25),
                label: 'Settings',
                tooltip: 'Settings',
                backgroundColor: Colors.black),
          ],
        ),
        iosContentPadding: false,
        iosContentBottomPadding: false);
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 30),
                child: PlatformText(
                  user.displayName!,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(255, 208, 104, 1),
                  ),
                ),
              ),
              const SignOutButton(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 40),
                child: PlatformText(
                  'Last Photos',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                  ),
                ),
              ),
              const FileContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 40),
                child: PlatformText(
                  'Last Drawings',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                  ),
                ),
              ),
              const FileContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 40),
                child: PlatformText(
                  'Last Animations',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                  ),
                ),
              ),
              const FileContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 40),
                child: PlatformText(
                  'Last Videos',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                  ),
                ),
              ),
              const FileContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 40),
                child: PlatformText(
                  'Last Others',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                  ),
                ),
              ),
              const FileContainer(),
            ],
          )),
    );
  }
}

class FileContainer extends StatefulWidget {
  const FileContainer({Key? key}) : super(key: key);

  @override
  _FileContainerState createState() => _FileContainerState();
}

class _FileContainerState extends State<FileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 475,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Article(),
          Article(),
          Article(),
          Article(),
          Article(),
          Article(),
          Article(),
          Article(),
          Article(),
          Article(),
        ],
      ),
    );
  }
}

class Article extends StatefulWidget {
  const Article({Key? key}) : super(key: key);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      margin: const EdgeInsets.only(right: 20),
      color: const Color.fromRGBO(255, 208, 104, 1),
      child: Column(
        children: [
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          ),
          Row(children: [
            Container(
              width: 310,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              padding: const EdgeInsets.all(8),
              child: PlatformText(
                "Pseudonym",
                style: const TextStyle(fontSize: 22),
              ),
              color: Colors.teal,
            ),
            Container(
              width: 40,
              // height: 20,
              padding: const EdgeInsets.all(8),
              child: PlatformIconButton(
                onPressed: () =>
                    PlatformAlertDialog(title: const Text('Comments section'), content: const Text('Some content')),
                cupertinoIcon: const Icon(Icons.share, size: 25),
                materialIcon: const Icon(Icons.share, size: 25, textDirection: TextDirection.rtl, color: Colors.teal,semanticLabel: 'Share'),
              ),
            ),
          ]),
          PlatformTextButton(
              onPressed: () =>
                  PlatformAlertDialog(title: const Text('Comments section'), content: const Text('Some content')),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 0),
                child: PlatformText(
                  'Comments section',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
