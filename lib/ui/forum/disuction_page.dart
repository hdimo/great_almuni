import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:greatalmuni/domain/comment.dart';
import 'package:greatalmuni/domain/discution.dart';
import 'package:greatalmuni/providers.dart';
import 'package:greatalmuni/ui/forum/widget/comment_form.dart';
import 'package:intl/intl.dart';

class DiscutionPage extends ConsumerStatefulWidget {
  const DiscutionPage(this.discution, {Key? key}) : super(key: key);

  final Discution discution;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscutionPageState();
}

class _DiscutionPageState extends ConsumerState<DiscutionPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.discution.comments);

    return Scaffold(
      appBar: AppBar(title: Text(widget.discution.title)),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.discution.title,
                style: TextStyle(fontSize: 32, color: Colors.blue[300]),
              ),
              Text(widget.discution.category),
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 223, 222, 220)),
                  child: Text(widget.discution.content)),
              const SizedBox(height: 15),
              const Divider(height: 1),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Commentaire',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              CommentForm(widget.discution),
              const SizedBox(height: 15),
              CommentWidget(widget.discution),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentWidget extends ConsumerWidget {
  const CommentWidget(this.discution, {Key? key}) : super(key: key);

  final Discution discution;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentStream = ref
        .watch(messageRepositoryProvider)
        .getCommentsForDiscution(discution.uid!);

    return StreamBuilder(
      stream: commentStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('erreur de connection');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox(width: 100, child: LinearProgressIndicator()));
        }
        return Column(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                var message = Comment.fromJson(data);
                return ListTile(
                  title: Text(message.content),
                  subtitle: Text(
                    message.username +
                        ' le ' +
                        DateFormat('MM/d à kk:mm').format(message.createdOn),
                  ),
                );
              })
              .toList()
              .cast(),
        );
      },
    );
  }
}
