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
        SizedBox(
            height: 300,
            width: double.infinity,
            child: AsesoriaCard(asesoria: asesoriasValoradas[0], large: true)),
        SizedBox(
            height: 300,
            width: double.infinity,
            child: AsesoriaCard(
                asesoria: asesoriasValoradas[0], large: true, bought: true)),
        SizedBox(
            height: 300,
            width: double.infinity,
            child: AsesoriaCard(
                asesoria: asesoriasValoradas[0],
                large: true,
                instructor: true)),
        _bookmarked()
      ],
    );
  }

  Widget _headerImg() {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Image.asset('assets/whitelogo_asset.png'),
    );
  }

  Widget _seccion(String header, List<AsesoriaModel> asesorias) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            header,
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: asesorias.length,
            itemBuilder: (BuildContext context, index) {
              return SizedBox(
                  width: 250, child: AsesoriaCard(asesoria: asesorias[index]));
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

  Widget _bookmarked() {
    return GridView.count(
      childAspectRatio: 1,
      physics: const AlwaysScrollableScrollPhysics(),
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
    );
  }
}
