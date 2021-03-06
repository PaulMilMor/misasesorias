import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => SafeArea(
          child: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              elevation: 1,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(0, 0, 0, 1.0),
                ),
                onPressed: () => Navigator.of(context).pop(),
                iconSize: 32,
              ),
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.all(36.0), child: _loginForm()),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _emailTxt(),
          _passwordTxt(),
          _loginButton(),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 30, right: 12, bottom: 6),
          ),
          const Divider(
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 30, right: 12, bottom: 6),
          ),
          _googleLoginButton(),
        ],
      ),
    );
  }

  Widget _emailTxt() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 6),
      child: TextField(
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: 'CORREO ELECTRONICO',
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _passwordTxt() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 60),
      child: TextField(
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: 'CONTRASEÑA',
        ),
        obscureText: true,
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: const Text('INGRESAR', style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(0, 172, 255, 1.0),
          elevation: 0,
          side: const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        onPressed: _loginAction,
      ),
    );
  }

  Widget _googleLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: const Text('INGRESAR CON GOOGLE',
            style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(222, 222, 222, 1.0),
          elevation: 0,
          side: const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        onPressed: _loginAction,
      ),
    );
  }

  _loginAction() {
    String _email = _emailController.text;
    if (_email == "instructor") {
      Navigator.pushNamed(context, '/navigationInstructor');
    } else {
      Navigator.pushNamed(context, '/navigation');
    }
  }
}
