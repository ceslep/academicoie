// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:academicoie/modelo_notas.dart';

/*  */

class Concentrador extends StatefulWidget {
  final List<ModeloNotas> notasPeriodos;
  final List<String> periodos;
  final List<String> asignaturas;

  const Concentrador(
      {Key? key,
      required this.notasPeriodos,
      required this.periodos,
      required this.asignaturas})
      : super(key: key);

  @override
  State<Concentrador> createState() => _ConcentradorState();
}

class _ConcentradorState extends State<Concentrador> {
  String asignatura = "";
  String periodo = "";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          asignatura = widget.asignaturas[index];
          List<ModeloNotas> notas = widget.notasPeriodos
              .where((nota) => nota.asignatura == asignatura)
              .toList();
          int cantidadPeriodos = notas.length;
          double def = 0;
          Row row = Row(
            children: notas.map((nota) {
              String valoracion =
                  nota.valoracion != "" ? nota.valoracion : "0.0";
              double value = double.parse(valoracion);
              def += value;
              TextStyle style = value < 3
                  ? const TextStyle(color: Colors.red)
                  : const TextStyle(color: Colors.blue);
              return SizedBox(
                  width: 50,
                  child: Center(child: Text(valoracion, style: style)));
            }).toList(),
          );
          for (int i = 1; i <= 4 - cantidadPeriodos; i++) {
            row.children.add(const SizedBox(
                width: 50,
                child: Center(
                    child: Text("0.0", style: TextStyle(color: Colors.red)))));
          }
          row.children.add(const SizedBox(
              child: Icon(
            Icons.arrow_right_alt,
            color: Colors.green,
          )));
          row.children.add(SizedBox(
            width: 50,
            child: Center(
              child: Text(
                (def / 4).toStringAsFixed(1),
                style: (def / 4) < 3
                    ? const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
              ),
            ),
          ));
          return ListTile(
            title: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 120,
                            child: Text(
                              widget.asignaturas[index],
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    row,
                  ],
                ),
                const Divider()
              ],
            ),
          );
        }, childCount: widget.asignaturas.length))
      ],
    );
  }
}
