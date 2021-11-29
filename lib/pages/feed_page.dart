import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';
import 'package:mis_asesorias/models/categoria_model.dart';
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

  List<CategoriaModel> categorias = [
    CategoriaModel(
        titulo: 'Idiomas',
        imagen:
            'https://cdn.pixabay.com/photo/2018/07/08/08/45/abc-3523453_960_720.jpg'),
    CategoriaModel(
        titulo: 'Ciencias Exactas',
        imagen:
            'https://cdn.pixabay.com/photo/2016/11/29/01/16/abacus-1866497_960_720.jpg'),
    CategoriaModel(
        titulo: 'Informática',
        imagen:
            'https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg'),
    CategoriaModel(
        titulo: 'Ciencias Sociales',
        imagen:
            'https://cdn.pixabay.com/photo/2016/08/15/08/22/greece-1594689_960_720.jpg'),
    CategoriaModel(
        titulo: 'Ciencias Naturales',
        imagen:
            'https://cdn.pixabay.com/photo/2017/02/01/13/53/analysis-2030265_960_720.jpg'),
    CategoriaModel(
        titulo: 'Cosas del Hogar',
        imagen:
            'https://cdn.pixabay.com/photo/2015/10/20/18/57/furniture-998265_960_720.jpg'),
    CategoriaModel(
        titulo: 'Electrónica y Mecánica',
        imagen:
            'https://cdn.pixabay.com/photo/2014/09/20/13/52/board-453758_960_720.jpg'),
    CategoriaModel(
        titulo: 'Arte',
        imagen:
            'https://cdn.pixabay.com/photo/2016/11/23/00/37/art-1851483_960_720.jpg'),
    CategoriaModel(
        titulo: 'Manualidades',
        imagen:
            'https://cdn.pixabay.com/photo/2016/11/18/17/14/cloth-1835894_960_720.jpg'),
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
      height: 200,
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Categorías',
          ),
        ),
        GridView.count(
          physics: const ScrollPhysics(),
          childAspectRatio: 1,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: List.generate(categorias.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/categories',
                    arguments: categorias[index]);
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Image.network(
                              categorias[index].imagen,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: double.infinity,
                            ),
                          ),
                        ),
                        Flexible(child: Text(categorias[index].titulo)),
                      ],
                    ),
                  )),
            );
          }),
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
