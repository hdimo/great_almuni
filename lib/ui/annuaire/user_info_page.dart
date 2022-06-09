import 'package:flutter/material.dart';
import 'package:greatalmuni/domain/user.dart';
import 'package:greatalmuni/ui/messagerie/message_user_page.dart';

class UserInfoPage extends StatelessWidget {
  final User user;

  const UserInfoPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child:
                  user.img == null ? CircleAvatar() : Image.network(user.img!),
            ),
            const Divider(),
            Text(user.email),
            const Divider(),
            Text(user.speciality!),
            const Divider(),
            Text(user.departement!),
            const Divider(),
            Text(user.year!),
            const Divider(),
            Text(user.hobies!),
            const Divider(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => MessageUserPage(user: user)),
                );
              },
              icon: const Icon(Icons.message),
              label: const Text('Envoyer un message'),
            )
          ],
        ),
      ),
    );
  }
}
