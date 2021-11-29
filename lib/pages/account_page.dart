import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';
import 'package:mis_asesorias/widgets/asesoria_card_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<AsesoriaModel> asesoriasValoradas = [
    AsesoriaModel(
        titulo: 'titulo de asesoría',
        categoria: 'categoria',
        precio: 200,
        descripcion: 'descripcion',
        imagen:
            'https://media.istockphoto.com/photos/female-teacher-pointing-with-finger-at-mathematical-equation-on-in-picture-id1080232656?k=20&m=1080232656&s=612x612&w=0&h=7OszmnpcTXIiIhqUXUL3sOaI-nn9DisJU8z3ceeHL5k=',
        instructor: 'nombre instructor',
        valoracion: 1),
    AsesoriaModel(
        titulo: 'titulo de asesoría',
        categoria: 'categoria',
        precio: 200,
        descripcion: 'descripcion',
        imagen: 'imagen',
        instructor: 'nombre instructor',
        valoracion: 1),
    AsesoriaModel(
        titulo: 'titulo de asesoría',
        categoria: 'categoria',
        precio: 200,
        descripcion: 'descripcion',
        imagen: 'imagen',
        instructor: 'nombre instructor',
        valoracion: 1),
    AsesoriaModel(
        titulo: 'titulo de asesoría',
        categoria: 'categoria',
        precio: 200,
        descripcion: 'descripcion',
        imagen: 'imagen',
        instructor: 'nombre instructor',
        valoracion: 1),
  ];
  bool _isInstructor = false;
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _isInstructor = ModalRoute.of(context)!.settings.arguments as bool;
    }
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
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
                  _isInstructor
                      ? _backButton()
                      : Container(
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
          _isInstructor
              ? _chatButton()
              : Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit_rounded,
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                    onPressed: () {
                      _showDialog();
                      //_reportDialog();
                      //_rateDialog();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
          _isInstructor ? _alumnoAsesorias() : _bookmarked(),
        ],
      ),
    )));
  }

  Widget _chatButton() {
    return Container(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(
          Icons.chat_bubble_outline,
          color: Color.fromRGBO(0, 0, 0, 1.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/chatscreen');
          //_reportDialog();
          //_rateDialog();
        },
        iconSize: 32,
      ),
    );
  }

  Widget _backButton() {
    return Container(
        /* width: 250,
      alignment: const Alignment(-1.4, -0.8),
      //alignment: const Alignment(1.2, -0.8),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color.fromRGBO(0, 0, 0, 1.0),
        ),
        onPressed: () => Navigator.of(context).pop(),
        iconSize: 32,
      ),*/
        );
  }

  Widget _alumnoAsesorias() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Mi alumno en:",
              style: TextStyle(
                fontSize: 18.0,
              )),
          ListView.builder(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: asesoriasValoradas.length,
            itemBuilder: (BuildContext context, index) {
              return SizedBox(
                height: 300,
                width: double.infinity,
                child: AsesoriaCard(
                  asesoria: asesoriasValoradas[index],
                  large: true,
                  instructor: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _bookmarked() {
    return Column(
      children: [
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
        GridView.count(
          childAspectRatio: 1,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: List.generate(asesoriasValoradas.length, (index) {
            AsesoriaModel asesoria = asesoriasValoradas[index];
            return AsesoriaCard(
              asesoria: asesoria,
              bookmarked: true,
            );
          }),
        ),
      ],
    );
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
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.account_circle_rounded,
                      size: 80,
                      color: Color.fromRGBO(210, 210, 210, 1),
                    )),
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
