import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/domain/user.dart';

class MessageUserPage extends ConsumerStatefulWidget {
  const MessageUserPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MessageUserPageState();
}

class _MessageUserPageState extends ConsumerState<MessageUserPage> {
  TextEditingController? messageController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(widget.user.name),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'obligatoire' : null,
                  controller: messageController,
                  decoration:
                      const InputDecoration(labelText: 'Ecrire un message'),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 250,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      label: const Text(''),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
