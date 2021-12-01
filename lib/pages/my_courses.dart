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
        titulo: 'Power Your Dreams',
        categoria: 'categoria',
        precio: 200,
        descripcion:
            'Praesent tincidunt nibh sem, eu gravida est mollis eget. Pellentesque euismod felis non porta lobortis. Aliquam sit amet massa congue, gravida mauris nec, viverra sapien.',
        imagen: 'https://i.ytimg.com/vi/F06b_reZxiY/maxresdefault.jpg',
        instructor: 'Memo VII Z',
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
