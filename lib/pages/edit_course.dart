import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditCoursePage extends StatefulWidget {
  const EditCoursePage({Key? key}) : super(key: key);

  @override
  _EditCoursePageState createState() => _EditCoursePageState();
}

class _EditCoursePageState extends State<EditCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => SafeArea(
          child: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              elevation: 1,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(0, 0, 0, 1.0),
                ),
                onPressed: () => Navigator.of(context).pop(),
                iconSize: 32,
              ),
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Editar Asesoría',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: _createcourseForm()),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _createcourseForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleTxt(),
          _category(),
          _priceTxt(),
          _descriptionTxt(),

          const Padding(
            padding: EdgeInsets.only(left: 12, top: 30, right: 12, bottom: 6),
          ),
          _text(),
          _images(),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 50, right: 12, bottom: 6),
          ),
          _buttons()
          //_googleLoginButton(),
        ],
      ),
    );
  }

  Widget _titleTxt() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Titulo',
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _category() {
    return Container(
      width: 325,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
        child: DropdownButton<String>(
          hint: const Text('Categoria(Seleccionar)'),
          items: <String>['Categoria(Seleccionar)'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget _priceTxt() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Precio(por hora)',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _descriptionTxt() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Descripción',
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _text() {
    return Container(
      width: 350,
      padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
      alignment: Alignment.topLeft,
      child: Column(children: const [
        Text('Imagenes de presentación'),
      ]),
    );
  }

  Widget _images() {
    return Container(
        width: 350,
        padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
        alignment: Alignment.topLeft,
        child: Column(children: [
          Container(
              width: 80,
              height: 65,
              alignment: Alignment.topLeft,
              color: Colors.grey[300],
              child: const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.add,
                  size: 32,
                  color: Color.fromRGBO(40, 40, 40, 1.0),
                ),
              )),
        ]));
  }
  Widget _CreateButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: const Text('PUBLICAR', style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(0, 172, 255, 1.0),
          elevation: 0,
          side: const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
        },
      ),
    );
  }
Widget _buttons() {
    return Container(
      width: 350,
      padding: EdgeInsets.fromLTRB(12, 16, 12, 6),
      alignment: Alignment.topRight,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('GUARDAR', style: TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(0, 172, 255, 1.0),
            elevation: 0,
            side: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
          },
        ),

      ]),
    );
  }
}
