import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/providers.dart';
import 'package:greatalmuni/ui/auth/login_page.dart';
import 'package:greatalmuni/ui/core/input_theme.dart';
import 'package:greatalmuni/ui/main_page.dart';
import 'package:greatalmuni/ui/user/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: MyInputTheme().theme()),
      home: Consumer(
        builder: (_, ref, __) {
          final auth = ref.watch(authProvider);
          if (auth is AuthStateLoggedIn) {
            return MainPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
