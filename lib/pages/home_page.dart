import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //_checkSession();
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 255, 255, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _image(),
              _buttons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return SizedBox(
        width: double.infinity,
        height: 600,
      child: Image.asset(
        'assets/whitelogo_asset.png',
        width: 180,
      ),
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _loginButton(),
          _signUpButton(),
        ],
      ),
    );
  }

  Widget _signUpButton() {
    return ElevatedButton(
      child: const Text(
        'REGISTRARSE',
        style: TextStyle(
          color: Color.fromRGBO(5, 5, 5, 1.0),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/signup');
      },
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      child:
          const Text('INICIAR SESIÓN', style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        primary: const Color.fromRGBO(0, 172, 255, 1.0),
        elevation: 0,
        side: const BorderSide(
          width: 1.0,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}
