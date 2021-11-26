import 'package:flutter/material.dart';
import 'package:mis_asesorias/pages/chats_page.dart';
import 'package:mis_asesorias/pages/feed_page.dart';

import 'account_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final List<String> _titles = [
    'INICIO',
    'A?',
    'CHAT',
    'PERFIL',
  ];

  final List<Widget> _tabs = [
    const FeedPage(),
    const FeedPage(),
    const chatsPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _tabs[_selectedIndex],
      bottomNavigationBar: _bottomBar(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 28,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.font_download), label: 'Mis Asesorías'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}
