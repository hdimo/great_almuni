import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/application/user/user_state.dart';
import 'package:greatalmuni/providers.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  TextEditingController? nameTextController;
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  TextEditingController? departmentTextController;
  TextEditingController? yearTextController;
  TextEditingController? specialityTextController;
  TextEditingController? hobbiesTextController;

  File? _userAvatar;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    departmentTextController = TextEditingController();
    yearTextController = TextEditingController();
    specialityTextController = TextEditingController();
    hobbiesTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameTextController?.dispose();
    emailTextController?.dispose();
    passwordTextController?.dispose();
    departmentTextController?.dispose();
    yearTextController?.dispose();
    specialityTextController?.dispose();
    hobbiesTextController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userNotifierProvider, ((previous, next) {
      if (next is UserStateError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      }

      if (next is UserStateConnected) {
        Navigator.of(context).pop();
      }
    }));
    return Scaffold(
      appBar: AppBar(title: Text('Inscription')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        final file = await ImagePicker.platform.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {
                          print(file?.path);
                          _userAvatar = File(file!.path);
                        });
                      },
                      child: const Text('choisir une image')),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: _validateInputNoEmpty,
                    controller: nameTextController,
                    decoration:
                        const InputDecoration(labelText: 'Nom et prénom'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: _validateInputNoEmpty,
                    controller: emailTextController,
                    decoration:
                        const InputDecoration(labelText: 'Address mail'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: _validateInputNoEmpty,
                    controller: passwordTextController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Mot de passe'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: _validateInputNoEmpty,
                    controller: departmentTextController,
                    decoration: const InputDecoration(
                        labelText: 'Le département d’habitation'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: _validateInputNoEmpty,
                    controller: yearTextController,
                    decoration: const InputDecoration(
                        labelText: 'l’année de promotion'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: _validateInputNoEmpty,
                    controller: specialityTextController,
                    decoration: const InputDecoration(labelText: 'Spécialité'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: _validateInputNoEmpty,
                    controller: hobbiesTextController,
                    decoration: const InputDecoration(
                        labelText: 'Les hobbies, passions'),
                    maxLines: 3,
                  ),
                  if (ref.watch(userNotifierProvider) is UserStateLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton.icon(
                      label: const Text(''),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          registerNewUser(
                            nameTextController!.text,
                            emailTextController!.text,
                            passwordTextController!.text,
                            departmentTextController!.text,
                            yearTextController!.text,
                            specialityTextController!.text,
                            hobbiesTextController!.text,
                            _userAvatar,
                          );
                        }
                      },
                      icon: const Icon(Icons.check),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerNewUser(
    String fullname,
    String email,
    String password,
    String departement,
    String year,
    String speciality,
    String hobies,
    File? avatare,
  ) {
    ref.read(userNotifierProvider.notifier).registerNewUser(
          fullname,
          email,
          password,
          speciality,
          departement,
          hobies,
          avatare,
        );
  }

  String? _validateInputNoEmpty(String? v) {
    if (v == null || v.isEmpty) {
      return 'le champ doit pas etre vide';
    }
  }
}
