import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchOptionProvider = StateProvider<String>((ref) => 'Wszystko');

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchOption = ref.watch(searchOptionProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Wyszukiwanie'),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          CupertinoSegmentedControl<String>(
            children: {
              'Wszystko': Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Wszystko'),
              ),
              'Obrazy': Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Obrazy'),
              ),
              'Wideo': Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Wideo'),
              ),
            },
            groupValue: searchOption,
            onValueChanged: (value) {
              ref.read(searchOptionProvider.notifier).state = value;
            },
          ),
          Expanded(
            child: Center(
              child: Text('Wybrano: $searchOption'),
            ),
          ),
        ],
      ),
    );
  }
}
