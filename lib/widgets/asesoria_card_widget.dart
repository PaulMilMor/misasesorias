import 'package:flutter/material.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';

class AsesoriaCard extends StatelessWidget {
  final AsesoriaModel asesoria;

  const AsesoriaCard({Key? key, required this.asesoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Image.network(asesoria.imagen,
                    width: 160, fit: BoxFit.cover),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(asesoria.titulo), Text('\$${asesoria.precio}')],
              ),
              Text(asesoria.instructor),
              Text(asesoria.descripcion),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(asesoria.valoracion.toString()),
              )
            ],
          ),
        ));
  }
}
