import 'package:flutter/material.dart';
import 'package:mis_asesorias/models/asesoria_model.dart';

class AsesoriaCard extends StatefulWidget {
  final AsesoriaModel asesoria;
  final bool large;
  final bool bought;
  final bool instructor;
  final bool bookmarked;
  const AsesoriaCard({
    Key? key,
    required this.asesoria,
    this.large = false,
    this.bought = false,
    this.instructor = false,
    this.bookmarked = false,
  }) : super(key: key);

  @override
  State<AsesoriaCard> createState() => _AsesoriaCardState();
}

class _AsesoriaCardState extends State<AsesoriaCard> {
  bool _bookmarked = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _bookmarked = widget.bookmarked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: widget.large || widget.bookmarked ? 6 : 4,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Stack(children: [
                  Image.network(widget.asesoria.imagen,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: double.infinity),
                  Visibility(
                    visible: !widget.bought,
                    child: Positioned(
                        right: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _bookmarked = !_bookmarked;
                            });
                          },
                          child: _bookmarked
                              ? const Icon(Icons.bookmark, color: Colors.blue)
                              : const Icon(
                                  Icons.bookmark_border,
                                  color: Colors.grey,
                                ),
                        )),
                  ),
                ]),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.asesoria.titulo),
                  Row(
                    children: [
                      Visibility(
                          visible: widget.instructor,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(Icons.star),
                          )),
                      Visibility(
                        visible: !widget.bought && !widget.bookmarked,
                        child: Text('\$${widget.asesoria.precio}',
                            style: const TextStyle(color: Colors.grey)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
                visible: !widget.instructor,
                child:
                    Flexible(flex: 1, child: Text(widget.asesoria.instructor))),
            Flexible(
                flex: widget.bookmarked ? 1 : 2,
                child: Visibility(
                  visible: !widget.bookmarked,
                  child: Text(widget.asesoria.descripcion,
                      style: const TextStyle(color: Colors.grey)),
                )),
            Flexible(
              flex: widget.bookmarked ? 1 : 2,
              child: Visibility(
                visible: !widget.bookmarked,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: widget.instructor,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                    Visibility(
                      visible: widget.instructor,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    widget.bought || widget.instructor
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                            ))
                        : const Icon(Icons.star),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
