import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';

class AsesoriaDetailedPage extends StatefulWidget {
  const AsesoriaDetailedPage({Key? key}) : super(key: key);

  @override
  _AsesoriaDetailedPageState createState() => _AsesoriaDetailedPageState();
}

class _AsesoriaDetailedPageState extends State<AsesoriaDetailedPage> {
  late AsesoriaModel asesoria;
  late bool isInstructor;
  @override
  Widget build(BuildContext context) {
    List<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    asesoria = args[0];
    isInstructor = args[1];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.grey),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: _getActions(),
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: _detailedPage(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Visibility(visible: !isInstructor, child: _comprar()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getActions() {
    if (isInstructor) {
      return [
        PopupMenuButton(
          onSelected: (result) {
            switch (result) {
              case 1:
                Navigator.pushNamed(context, '/editCourse');
                break;
              case 2:
                Navigator.pushNamed(context, '/detail',
                    arguments: [asesoria, false]);
                break;
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(child: Text("Editar"), value: 1),
            PopupMenuItem(child: Text("Ver como estudiante"), value: 2)
          ],
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              asesoria.bookmarked = !asesoria.bookmarked;
            });
          },
          icon: asesoria.bookmarked
              ? const Icon(Icons.bookmark, color: Colors.blue)
              : const Icon(
                  Icons.bookmark_border,
                  color: Colors.grey,
                ),
        ),
        IconButton(
          onPressed: () {
            _reportDialog();
          },
          icon: const Icon(Icons.report, color: Colors.grey),
        ),
      ];
    }
  }

  Widget _detailedPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerImg(),
        _name(),
        Visibility(visible: !isInstructor, child: _instructor()),
        _tabs(),
        _tabContent(),
        _lists(),
        const SizedBox(height: 56),
      ],
    );
  }

  Widget _headerImg() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Image.network(
        asesoria.imagen,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _name() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              asesoria.titulo,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                Text('\$${asesoria.precio}',
                    style: const TextStyle(color: Colors.grey)),
                const Icon(Icons.star),
              ],
            ),
          ]),
    );
  }

  Widget _instructor() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle_rounded,
            size: 56,
            color: Color.fromRGBO(210, 210, 210, 1),
          ),
          const SizedBox(width: 8),
          Text(asesoria.instructor),
        ],
      ),
    );
  }

  Widget _tabs() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.8)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SizedBox(
          height: 50,
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottom: const TabBar(
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                    child: Text('Descripción',
                        style: TextStyle(color: Colors.black))),
                Tab(
                    child: Text('Contenido',
                        style: TextStyle(color: Colors.black))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabContent() {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          children: [
            // first tab bar view widget
            Text(asesoria.descripcion),

            // second tab bar viiew widget
            const Text(
                'Resumen del contenido (que se incluye en el curso): \n\n4 recursos de video adicional\n2 prácticas\nProyecto Final\nQuiz Personalizado'),
          ],
        ),
      ),
    );
  }

  Widget _lists() {
    if (isInstructor) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Estudiantes Activos',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        _estudiante(),
        _estudiante(),
        _estudiante(),
        _estudiante(),
        _estudiante(),
      ]);
    } else {
      return Column(
        children: [
          _reviews(),
          _reviewIndividual(),
          _reviewIndividual(),
          _reviewIndividual(),
          _reviewIndividual(),
          _reviewIndividual(),
        ],
      );
    }
  }

  Widget _estudiante() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Row(
        children: const [
          Icon(
            Icons.account_circle_rounded,
            size: 56,
            color: Color.fromRGBO(210, 210, 210, 1),
          ),
          SizedBox(width: 8),
          Text('Nombre Usuario')
        ],
      ),
    );
  }

  Widget _reviews() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reseñas',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.chat_bubble_outline_outlined, size: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('20', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Reseñas'),
                  ],
                ),
                const SizedBox(width: 20),
                const Icon(Icons.favorite_border_outlined, size: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('95%', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Positivas'),
                  ],
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewIndividual() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle_rounded,
            size: 56,
            color: Color.fromRGBO(210, 210, 210, 1),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Row(
                children: const [
                  Text('Usuario',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Icon(Icons.star)
                ],
              ),
              const Text('Comentario'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _comprar() {
    return Container(
      color: Colors.grey[300],
      height: 48,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${asesoria.precio}'),
            ElevatedButton(
              child:
                  const Text('Comprar', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(0, 172, 255, 1.0),
                elevation: 0,
                side: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _rateDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _reportDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Reportar",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold),
                    )),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("¿Porqué quieres reportar esta asesoría?"),
                const SizedBox(
                  height: 15,
                ),
                DropdownButton<String>(
                  hint: const Text('(Seleccionar)'),
                  items: <String>['(Seleccionar)'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Reportar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _chips() {
    return Container(
      child: Row(children: [
        ChoiceChip(
          label: Text('Choice 1'),
          selected: true,
        ),
        ChoiceChip(
          label: Text('Choice 2'),
          selected: false,
        ),
        ChoiceChip(
          label: Text('Choice 3'),
          selected: false,
        ),
      ]),
    );
  }

  Widget _ratingbar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Future<void> _rateDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Califica a 'John Doe'",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold),
                    )),
                const Icon(
                  Icons.account_circle_rounded,
                  size: 80,
                  color: Color.fromRGBO(210, 210, 210, 1),
                ),
                _ratingbar(),
                _chips(),
                _chips(),
                _chips(),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("¿Qué te parecerió el contenido de Ciencias ||?"),
                const SizedBox(
                  height: 15,
                ),
                _ratingbar(),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Continuar'),
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
