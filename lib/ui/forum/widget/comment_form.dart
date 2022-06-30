import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentForm extends ConsumerStatefulWidget {
  const CommentForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentFormState();
}

class _CommentFormState extends ConsumerState<CommentForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _commentController;

  @override
  void initState() {
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'champ obligatoire';
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // send to notifier
                    }
                  },
                  child: const Text('ajouter'))
            ],
          )),
    );
  }
}
