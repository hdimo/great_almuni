import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/providers.dart';

class NewDiscutionPage extends ConsumerStatefulWidget {
  const NewDiscutionPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscutionPageState();
}

class _DiscutionPageState extends ConsumerState<NewDiscutionPage> {
  final _formKey = GlobalKey<FormState>();

  final categories = ['informatique', 'chimie'];

  TextEditingController? subjetController;
  TextEditingController? contentController;

  String? _selectedCategorie;

  @override
  void initState() {
    _selectedCategorie = categories.first;
    subjetController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ecrire un nouveau article')),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: subjetController,
                  decoration: const InputDecoration(hintText: 'Sujet'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: DropdownButton<String>(
                    value: _selectedCategorie,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategorie = value;
                      });
                    },
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: contentController,
                  maxLines: 6,
                  decoration: const InputDecoration(hintText: 'Contenu'),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('Ajouter'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final currentUser =
                          (ref.watch(authProvider) as AuthStateLoggedIn).user;
                      ref.read(discutionStateProvider.notifier).addNew(
                            subjetController!.text,
                            contentController!.text,
                            _selectedCategorie!,
                            currentUser!.uid,
                          );
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
