import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/providers.dart';
import 'package:greatalmuni/ui/annuaire/user_info_page.dart';

class AnnuaireHomePage extends ConsumerWidget {
  const AnnuaireHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(annuaireProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (users) {
            print('🀄');
            print(users);
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            print('🅱️');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    UserInfoPage(user: users[index]),
                              ),
                            );
                          },
                          title: Text(users[index].name),
                          subtitle: Text(users[index].email),
                          leading: CircleAvatar(
                            child: users[index].img == null
                                ? CircleAvatar()
                                : Image.network(users[index].img!),
                          ),
                          trailing: Icon(Icons.arrow_right),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(annuaireProvider.notifier).getUsers(),
                    child: Text('rafraichir'),
                  )
                ],
              ),
            );
          },
          error: (message) => Center(
            child: Column(
              children: [
                Text(
                  message,
                  style: TextStyle(color: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(annuaireProvider.notifier).getUsers(),
                  child: Text('rafraichir'),
                )
              ],
            ),
          ),
        );
  }
}
