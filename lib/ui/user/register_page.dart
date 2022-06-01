import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? nameTextController;
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  TextEditingController? departmentTextController;
  TextEditingController? yearTextController;
  TextEditingController? specialityTextController;
  TextEditingController? hobbiesTextController;

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: nameTextController,
                    decoration:
                        const InputDecoration(labelText: 'Nom et prénom'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailTextController,
                    decoration:
                        const InputDecoration(labelText: 'Address mail'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordTextController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Mot de passe'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: departmentTextController,
                    decoration: const InputDecoration(
                        labelText: 'Le département d’habitation'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: yearTextController,
                    decoration: const InputDecoration(
                        labelText: 'l’année de promotion'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: specialityTextController,
                    decoration: const InputDecoration(labelText: 'Spécialité'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: hobbiesTextController,
                    decoration: const InputDecoration(
                        labelText: 'Les hobbies, passions'),
                    maxLines: 3,
                  ),
                  ElevatedButton.icon(
                    label: const Text(''),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerNewUser(
                          nameTextController?.text,
                          emailTextController?.text,
                          passwordTextController?.text,
                          departmentTextController?.text,
                          yearTextController?.text,
                          specialityTextController?.text,
                          hobbiesTextController?.text,
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
    String? text,
    String? text2,
    String? text3,
    String? text4,
    String? text5,
    String? text6,
    String? text7,
  ) {}
}
