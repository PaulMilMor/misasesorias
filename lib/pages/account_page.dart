import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            child: Container(
              width: double.infinity,
              height: 125,
              child: Row(
                children: [
                  Container(
                      alignment: const Alignment(-0.6, 25.0),
                      child: const Icon(
                        Icons.account_circle_rounded,
                        size: 120,
                        color: Color.fromRGBO(210, 210, 210, 1),
                      )),
                  Container(
                    width: 250,
                    alignment: const Alignment(1.2, -0.8),
                    child: PopupMenuButton(
                        //icon: Icon(Icons.more_),
                        onSelected: (result) {
                          if (result == 1) {
                            Navigator.pushNamed(context, '/');
                          }
                        },
                        itemBuilder: (context) => [

                              const PopupMenuItem(
                                child: Text("Cerrar sesión"),
                                value: 1,
                              ),
                            ]),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.edit_rounded,
                color: Color.fromRGBO(0, 0, 0, 1.0),
              ),
              onPressed: () {
                _showDialog();
              },
              iconSize: 32,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: const Alignment(-0.9, -0.8),
            child: Column(
              children: const [
                Text(
                  "Nombre",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 350,
            height: 30,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Container(
            width: 350,
            alignment: Alignment.topLeft,
            child: Wrap(children: const [
              Icon(Icons.book),
              Text(" Elementos guardados",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ]),
          ),
        ],
      ),
    ));
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Container(
                  alignment: Alignment.center,
                    child: const Icon(
                      Icons.account_circle_rounded,
                      size: 80,
                      color: Color.fromRGBO(210, 210, 210, 1),
                    )
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Nombre Completo',
                  ),
                  keyboardType: TextInputType.name,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Correo Electronico',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
