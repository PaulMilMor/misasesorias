import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
            /*SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child:
                Padding(padding: const EdgeInsets.all(36.0), child: _loginForm()),
              ),
            ),*/
          ]),
        ),
      ),
    );
  }

}
