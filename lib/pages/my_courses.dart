import 'package:flutter/material.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';
import 'package:mis_asesorias/widgets/asesoria_card_widget.dart';

class MisAsesoriasPage extends StatefulWidget {
  final bool isInstructor;
  const MisAsesoriasPage({
    Key? key,
    this.isInstructor = false,
  }) : super(key: key);

  @override
  _MisAsesoriasPageState createState() => _MisAsesoriasPageState();
}

class _MisAsesoriasPageState extends State<MisAsesoriasPage> {
  List<AsesoriaModel> asesorias = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Mis Asesorías',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 0, 0, 1.0),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: _asesoriasList(),
      )),
    );
  }

  Widget _asesoriasList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          _cards(),
        ],
      ),
    );
  }

  Widget _cards() {
    return ListView.builder(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: asesorias.length,
      itemBuilder: (BuildContext context, index) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: AsesoriaCard(
            asesoria: asesorias[index],
            large: true,
            bought: !widget.isInstructor,
            instructor: widget.isInstructor,
          ),
        );
      },
    );
  }
}
