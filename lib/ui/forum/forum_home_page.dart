import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/domain/discution.dart';
import 'package:greatalmuni/providers.dart';
import 'package:greatalmuni/ui/forum/disuction_page.dart';
import 'package:intl/intl.dart';

class ForumHomePage extends ConsumerStatefulWidget {
  const ForumHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForumHomePageState();
}

class _ForumHomePageState extends ConsumerState<ForumHomePage> {
  @override
  Widget build(BuildContext context) {
    final discutionStream =
        ref.watch(messageRepositoryProvider).getDiscutions();

    return StreamBuilder(
      stream: discutionStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox(width: 100, child: LinearProgressIndicator()));
        }
        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                data['uid'] = document.reference.id;
                var message = Discution.fromJson(data);
                return ListTile(
                  onTap: () {
                    final discution = Discution.fromJson(data);
                    print(discution);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return DiscutionPage(discution);
                      },
                    ));
                  },
                  title: Text(message.title),
                  subtitle: Text(message.category +
                      ' le ' +
                      DateFormat('MM/d à kk:mm').format(message.createdOn)),
                );
              })
              .toList()
              .cast(),
        );
      },
    );
  }
}
