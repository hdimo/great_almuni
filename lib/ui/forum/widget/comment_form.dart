import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/domain/discution.dart';
import 'package:greatalmuni/providers.dart';

class CommentForm extends ConsumerStatefulWidget {
  const CommentForm(this.discution, {Key? key}) : super(key: key);

  final Discution discution;

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
      child: ref.watch(commentStateProvider).when(
            loading: () => const CircularProgressIndicator(),
            init: () => Form(
              key: _formKey,
              child: Row(
                children: [
                  TextFormField(
                    controller: _commentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'champ obligatoire';
                      }
                    },
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // send to notifier
                          final user =
                              (ref.watch(authProvider) as AuthStateLoggedIn)
                                  .user;
                          ref
                              .read(commentStateProvider.notifier)
                              .addCommentToDiscution(
                                widget.discution,
                                user!,
                                _commentController!.text,
                              );
                        }
                      },
                      child: const Text('ajouter'))
                ],
              ),
            ),
          ),
    );
  }
}
