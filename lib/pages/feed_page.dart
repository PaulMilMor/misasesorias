import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';
import 'package:mis_asesorias/widgets/asesoria_card_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<AsesoriaModel> asesoriasValoradas = [
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
    AsesoriaModel(
        titulo: 'titulo de asesoría',
        categoria: 'categoria',
        precio: 200,
        descripcion: 'descripcion',
        imagen: 'imagen',
        instructor: 'nombre instructor',
        valoracion: 1),
  ];
  List<AsesoriaModel> asesoriasNuevas = [
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: _feedView(),
        ),
      ),
    );
  }

  Widget _feedView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerImg(),
        _seccion('Mejor Valorados', asesoriasValoradas),
        _seccion('Nuevo', asesoriasNuevas),
        _categorias(),
      ],
    );
  }

  Widget _headerImg() {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Image.asset('assets/whitelogo_asset.png'),
    );
  }

  Widget _seccion(String header, List<AsesoriaModel> asesorias) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            header,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: asesorias.length,
            itemBuilder: (BuildContext context, index) {
              return AsesoriaCard(asesoria: asesorias[index]);
              /*return Column(
                children: [
                  Text(asesorias[index].imagen),
                  Text(asesorias[index].titulo),
                  Text(asesorias[index].precio.toString()),
                  Text(asesorias[index].instructor),
                  Text(asesorias[index].descripcion),
                ],
              );*/
            },
          ),
        ),
      ]),
    );
  }

  Widget _categorias() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Categorías',
          ),
        ),
      ]),
    );
  }
}
