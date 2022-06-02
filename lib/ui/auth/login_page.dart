import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/providers.dart';
import 'package:greatalmuni/ui/user/register_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    return Scaffold(
      body: Center(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bienvenue a greatAlmuni+'),
                const Divider(
                  height: 20,
                ),
                TextFormField(
                  controller: emailTextController,
                  decoration: const InputDecoration(labelText: 'Address mail'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordTextController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Mot de passe'),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (ref.watch(authProvider) is AuthStateLoading)
                  const LinearProgressIndicator(),
                if (state is AuthStateError)
                  Text(
                    state.message,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      label: const Text('se connecter'),
                      onPressed: () {
                        ref.read(authProvider.notifier).login(
                              emailTextController!.text,
                              passwordTextController!.text,
                            );
                      },
                      icon: const Icon(Icons.check),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ));
                      },
                      child: const Text("S'inscrire"),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
