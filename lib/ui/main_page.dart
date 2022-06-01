import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/providers.dart';
import 'package:greatalmuni/ui/annuaire/annuaire_home_page.dart';
import 'package:greatalmuni/ui/forum/forum_home_page.dart';
import 'package:greatalmuni/ui/messagerie/messagerie_home_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    AnnuaireHomePage(),
    ForumHomePage(),
    MessagerieHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabeal de bord'),
        actions: [
          IconButton(
              onPressed: () {
                // user state notifier to loggout user
                ref.watch(authProvider.notifier).logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Annuaire',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Actualité',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messagerie',
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
