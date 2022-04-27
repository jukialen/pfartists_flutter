// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AddingFile extends StatelessWidget {
  const AddingFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformApp(
      title: 'Adding a file',
      color: Color.fromARGB(33, 33, 33, 1),
      home: AddingForm(title: 'Adding a file'),
    );
  }
}

class AddingForm extends StatefulWidget {
  const AddingForm({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddingForm> createState() => _AddingFormState();
}

class _AddingFormState extends State<AddingForm> {
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
          child: PlatformText('Adding a file'),
        )
    );
  }
}