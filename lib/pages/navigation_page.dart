import 'package:flutter/material.dart';
import 'package:mis_asesorias/pages/chats_page.dart';
import 'package:mis_asesorias/pages/feed_page.dart';

import 'account_page.dart';

class NavigationPage extends StatefulWidget {
  final bool isInstructor;
  const NavigationPage({
    Key? key,
    this.isInstructor = false,
  }) : super(key: key);

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

//estas son las pantallas a las que podrá acceder el estudiante
  final List<Widget> _tabs = [
    const FeedPage(),
    const FeedPage(),
    const chatsPage(),
    const AccountPage(),
  ];
  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
    BottomNavigationBarItem(
        icon: Icon(Icons.font_download), label: 'Mis Asesorías'),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
  ];
//estas son las pantallas a las que podrá acceder el instructor
  final List<Widget> _instructorTabs = [
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];
  final List<BottomNavigationBarItem> _instructorItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Nueva Asesoría'),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: widget.isInstructor
          ? _instructorTabs[_selectedIndex]
          : _tabs[_selectedIndex],
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
      items: widget.isInstructor ? _instructorItems : _items,
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}
