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
        titulo: 'Cálculo',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra non sem et molestie. Fusce ultrices velit purus, non posuere libero placerat vel.',
        imagen:
            'https://media.istockphoto.com/photos/female-teacher-pointing-with-finger-at-mathematical-equation-on-in-picture-id1080232656?k=20&m=1080232656&s=612x612&w=0&h=7OszmnpcTXIiIhqUXUL3sOaI-nn9DisJU8z3ceeHL5k=',
        instructor: 'Lausa Mayor',
        valoracion: 1),
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
        titulo: 'Composición Musical',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Curabitur luctus id mi non efficitur. In magna dui, lobortis sit amet diam sodales, placerat porta ipsum. Vestibulum mollis ligula nec porta elementum. ',
        imagen:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0hoJXOQeUSPt94PYR46S_8U2zWUfWF0PnOw&usqp=CAU',
        instructor: 'Jaime Bond',
        valoracion: 1),
    AsesoriaModel(
        titulo: 'Whisky Casero',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Integer eu commodo nunc, id vestibulum purus. Donec feugiat justo quis sem suscipit, fringilla consequat eros pulvinar. Donec et odio fringilla, imperdiet eros ut, sollicitudin lectus.',
        imagen:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9DFIxQsWErMsK6zKuPBQUxR-CL3O5y5Kg_w&usqp=CAU',
        instructor: 'Alberto Singleton',
        valoracion: 1),
  ];
  List<AsesoriaModel> asesoriasNuevas = [
    AsesoriaModel(
        titulo: 'Finanzas',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Nam nec leo nibh. Suspendisse euismod leo ut tortor congue, eget cursus lacus dignissim. Vivamus non lobortis ante, id fringilla tellus. In blandit accumsan nisi, nec tincidunt justo viverra finibus. ',
        imagen:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTwkZbwLE9Gjn9N1QC5_2Z9z-RVjGTVPxS8g&usqp=CAU',
        instructor: 'Ryan Reyna',
        valoracion: 1),
    AsesoriaModel(
        titulo: 'Programación',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Sed dignissim justo velit, vel gravida neque accumsan nec. Morbi est arcu, egestas eu convallis ut, molestie nec velit. Maecenas sit amet lorem a tellus varius molestie.',
        imagen:
            'https://img.vixdata.io/pd/jpg-large/es/sites/default/files/p/pietro_ralph_bohner_wandavision.jpg',
        instructor: 'Pedro Máximo',
        valoracion: 1),
    AsesoriaModel(
        titulo: 'Mermelada de Ciruela',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Nullam at fringilla ex. Suspendisse vitae malesuada lectus, id venenatis mi. Nam imperdiet at eros at pellentesque. ',
        imagen:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRxOKp-NbmAUCM8lVEa1RMewBgwgy5QhXJYA&usqp=CAU',
        instructor: 'Luis Miguel',
        valoracion: 1),
    AsesoriaModel(
        titulo: 'Emprendimiento',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Morbi ornare erat orci, a feugiat nunc euismod vitae. Suspendisse ultricies augue vitae facilisis aliquet. Pellentesque quis porttitor purus, vel placerat tortor.',
        imagen:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1zCbxKzv40nNoBnX9VqM0S6Bne6A1aQCjfA&usqp=CAU',
        instructor: 'Bill Gates',
        valoracion: 1),
  ];

  List<CategoriaModel> categorias = [
    CategoriaModel(
        titulo: 'Arte',
        imagen:
            'https://cdn.pixabay.com/photo/2016/11/23/00/37/art-1851483_960_720.jpg'),
    CategoriaModel(
        titulo: 'Ciencias Exactas',
        imagen:
            'https://cdn.pixabay.com/photo/2016/11/29/01/16/abacus-1866497_960_720.jpg'),
    CategoriaModel(
        titulo: 'Ciencias Naturales',
        imagen:
            'https://cdn.pixabay.com/photo/2017/02/01/13/53/analysis-2030265_960_720.jpg'),
    CategoriaModel(
        titulo: 'Ciencias Sociales',
        imagen:
            'https://cdn.pixabay.com/photo/2016/08/15/08/22/greece-1594689_960_720.jpg'),
    CategoriaModel(
        titulo: 'Cosas del Hogar',
        imagen:
            'https://cdn.pixabay.com/photo/2015/10/20/18/57/furniture-998265_960_720.jpg'),
    CategoriaModel(
        titulo: 'Electrónica y Mecánica',
        imagen:
            'https://cdn.pixabay.com/photo/2014/09/20/13/52/board-453758_960_720.jpg'),
    CategoriaModel(
        titulo: 'Idiomas',
        imagen:
            'https://cdn.pixabay.com/photo/2018/07/08/08/45/abc-3523453_960_720.jpg'),
    CategoriaModel(
        titulo: 'Informática',
        imagen:
            'https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg'),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Image.asset('assets/images/mis_asesorias.png'),
      ),
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
