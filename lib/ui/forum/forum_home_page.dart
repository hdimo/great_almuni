import 'package:flutter/material.dart';

class ForumHomePage extends StatelessWidget {
  const ForumHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('apprendre a faire quelque chose'),
            subtitle: Text('informatique'),
            trailing: Icon(Icons.favorite),
          );
        },
      ),
    );
  }
}
