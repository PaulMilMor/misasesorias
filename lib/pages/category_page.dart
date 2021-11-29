import 'package:flutter/material.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';
import 'package:mis_asesorias/models/categoria_model.dart';
import 'package:mis_asesorias/widgets/asesoria_card_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
    final CategoriaModel categoria =
        ModalRoute.of(context)!.settings.arguments as CategoriaModel;
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          categoria.titulo,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 0, 0, 1.0),
          ),
        ),
        centerTitle: true,
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
        children: [_cards()],
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
          ),
        );
      },
    );
  }
}
