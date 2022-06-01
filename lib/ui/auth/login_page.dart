import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/providers.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;

  final _formKey = GlobalKey<FormState>();

  void initState() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  onPressed: () {},
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

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController? emailTextController;
//   TextEditingController? passwordTextController;

//   final _formKey = GlobalKey<FormState>();

//   void initState() {
//     emailTextController = TextEditingController();
//     passwordTextController = TextEditingController();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Form(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailTextController,
//               decoration: const InputDecoration(labelText: 'Address mail'),
//             ),
//             const SizedBox(height: 10),
//             TextFormField(
//               controller: passwordTextController,
//               obscureText: true,
//               decoration: const InputDecoration(labelText: 'Mot de passe'),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   label: const Text('se connecter'),
//                   onPressed: () {},
//                   icon: const Icon(Icons.check),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: const Text("S'inscrire"),
//                 )
//               ],
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
