// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformApp(
      title: 'Home',
      color: Color.fromARGB(33, 33, 33, 1),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
        body: const CustomCard(),
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

// Widget _buildContent() {
//   return const CustomCard();
// }

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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

class _FileContainerState extends State<FileContainer>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 480,
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
      color: Colors.red,
      child: Column(
        children: [
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          ),
          Row(children: [
            Container(
              width: 310,
              // height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Pseudonym",
                style: TextStyle(fontSize: 22),
              ),
              color: Colors.teal,
            ),
            Container(
              width: 20,
              height: 10,
              padding: const EdgeInsets.all(8),
              child: Icon(PlatformIcons(context).back),
              color: Colors.teal,
            ),
          ]),
          PlatformTextButton(
            onPressed: () =>
                PlatformAlertDialog(title: const Text('Comments section')),
            child: PlatformText(
              'Comments section',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}