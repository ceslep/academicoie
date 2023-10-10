// To parse this JSON data, do
//
//     final modeloPuestos = modeloPuestosFromJson(jsonString);

import 'dart:convert';

ModeloPuestos modeloPuestosFromJson(String str) =>
    ModeloPuestos.fromJson(json.decode(str));

String modeloPuestosToJson(ModeloPuestos data) => json.encode(data.toMap());

class ModeloPuestos {
  String estudiante;
  String nombres;
  String promedio;
  String grupo;
  String asignacion;
  int puesto;

  ModeloPuestos({
    required this.estudiante,
    required this.nombres,
    required this.promedio,
    required this.grupo,
    required this.asignacion,
    required this.puesto,
  });

  factory ModeloPuestos.fromJson(Map<String, dynamic> json) => ModeloPuestos(
        estudiante: json["estudiante"],
        nombres: json["nombres"],
        promedio: json["promedio"],
        grupo: json["grupo"],
        asignacion: json["asignacion"],
        puesto: json["puesto"],
      );

  Map<String, dynamic> toMap() => {
        "estudiante": estudiante,
        "nombres": nombres,
        "promedio": promedio,
        "grupo": grupo,
        "asignacion": asignacion,
        "puesto": puesto,
      };
}
