import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';
import 'package:mis_asesorias/models/categoria_model.dart';
import 'package:mis_asesorias/widgets/asesoria_card_widget.dart';

class InstructorProfilePage extends StatefulWidget {
  const InstructorProfilePage({Key? key}) : super(key: key);

  @override
  _InstructorProfilePageState createState() => _InstructorProfilePageState();
}

class _InstructorProfilePageState extends State<InstructorProfilePage> {
  List<AsesoriaModel> asesoriasValoradas = [
    AsesoriaModel(
        titulo: 'Power Your Dreams',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Praesent tincidunt nibh sem, eu gravida est mollis eget. Pellentesque euismod felis non porta lobortis. Aliquam sit amet massa congue, gravida mauris nec, viverra sapien.',
        imagen: 'https://i.ytimg.com/vi/F06b_reZxiY/maxresdefault.jpg',
        instructor: 'Memo VII Z',
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
  late String instructor;
  @override
  Widget build(BuildContext context) {
    instructor = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.grey),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(0, 0, 0, 1.0),
            ),
            onPressed: () => Navigator.of(context).pop(),
            iconSize: 32,
          ),
        ),
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
                            width: 150,
                            alignment: Alignment(-0.8, 1.8),
                            child: const Icon(
                              Icons.star,
                              size: 30,
                            )),
                        Container(
                            width: 150,
                            alignment: Alignment(-1.0, 5.0),
                            child: const Icon(
                              Icons.account_circle_rounded,
                              size: 100,
                              color: Color.fromRGBO(210, 210, 210, 1),
                            )),
                      ],
                    ),
                  ),
                ),
                _chatButton(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  alignment: const Alignment(-0.0, -0.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 350,
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text(
                            instructor,
                            style: const TextStyle(
                                fontSize: 25.0,
                                color: Colors.blueGrey,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "2222@gmail.com",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black45,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ]),
                      ),
                      Container(
                        width: 350,
                        alignment: Alignment.center,
                        child: const TextField(
                          maxLines: 2,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Bio',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                    Text(" Asesorías",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                  ]),
                ),
                SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: AsesoriaCard(
                        asesoria: asesoriasValoradas[0],
                        large: true,
                        instructor: false)),
                SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: AsesoriaCard(
                        asesoria: asesoriasValoradas[0],
                        large: true,
                        instructor: false)),
              ],
            ),
          ),
        ));
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
          Navigator.of(context).pushNamed('/chatscreen', arguments: instructor);
        },
        iconSize: 32,
      ),
    );
  }
}
