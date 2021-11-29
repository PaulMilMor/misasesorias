import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int? segmentedControlValue = 0;

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
                  'REGISTRARSE',
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
          const Text(
            'Registrarme como:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 0, 1.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 10, right: 12, bottom: 6),
          ),
          segmentedControl(),
          _photo(),
          _nameTxt(),
          _emailTxt(),
          _passwordTxt(),
          _loginButton(),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 20, right: 12, bottom: 6),
          ),
          const Divider(
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 20, right: 12, bottom: 6),
          ),
          _googleLoginButton(),
        ],
      ),
    );
  }

  Widget _addPhoto() {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: Colors.grey[200],
          ),
          height: 85,
          width: 85,
          child: const Icon(
            Icons.account_circle_rounded,
            size: 48,
            color: Color.fromRGBO(210, 210, 210, 1),
          )),
    );
  }

  Widget segmentedControl() {
    return Container(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlValue,
          backgroundColor: Colors.blue.shade200,
          children: const <int, Widget>{
            0: Text('Estudiante'),
            1: Text('Instructor')
          },
          onValueChanged: (value) {
            setState(() {
              segmentedControlValue = value as int?;
            });
          }),
    );
  }

  Widget _photo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          _addPhoto(),
          const Flexible(
            child: Padding(
                padding: EdgeInsets.all(8.0), child: Text('Foto de Perfil')),
          ),
        ],
      ),
    );
  }

  Widget _nameTxt() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'NOMBRE COMPLETO',
        ),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget _emailTxt() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'CORREO ELECTRONICO',
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _passwordTxt() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 60),
      child: TextField(
        decoration: InputDecoration(
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
        child: const Text('REGISTRARSE', style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(0, 172, 255, 1.0),
          elevation: 0,
          side: const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          //Navigator.pushNamed(context, 'feed');
        },
      ),
    );
  }

  Widget _googleLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: const Text('REGISTRARSE CON GOOGLE',
            style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(222, 222, 222, 1.0),
          elevation: 0,
          side: const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          //Navigator.pushNamed(context, 'feed');
        },
      ),
    );
  }
}
