import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/domain/discution.dart';
import 'package:greatalmuni/ui/forum/widget/comment_form.dart';

class DiscutionPage extends ConsumerStatefulWidget {
  const DiscutionPage(this.discution, {Key? key}) : super(key: key);

  final Discution discution;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscutionPageState();
}

class _DiscutionPageState extends ConsumerState<DiscutionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.discution.title)),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.discution.category),
              Text(widget.discution.content),
              Divider(),
              CommentForm()
            ],
          ),
        ),
      ),
    );
  }
}
