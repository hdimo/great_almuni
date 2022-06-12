import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForumDrawer extends ConsumerWidget {
  const ForumDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(child: Text('Categories')),
        CheckboxListTile(
          value: false,
          title: Text('Inforamtique'),
          onChanged: (v) {},
        ),
        CheckboxListTile(
          value: false,
          title: Text('chemie'),
          onChanged: (v) {},
        ),
      ]),
    );
  }
}
