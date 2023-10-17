// ignore_for_file: avoid_print

import 'package:academicoie/modelo_puestos.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String urlbase = 'https://app.iedeoccidente.com';

class PuestosProvider extends ChangeNotifier {
  List<ModeloPuestos> _data = [];

  List<ModeloPuestos> get data => _data;

  Future<void> updateData(
      String asignacion, String periodo, String year) async {
    final List<Map<String, dynamic>> data =
        await fetchDataFromJson(asignacion, periodo, year);
    print({'lengthdataPuestos': data.length});
    setData(data);
  }

  void setData(List<Map<String, dynamic>> jsonData) {
    if (jsonData.isEmpty) {
      return;
    }
    _data = jsonData.map((json) => ModeloPuestos.fromJson(json)).toList();
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> fetchDataFromJson(
      String asignacion, String periodo, String year) async {
    final url = Uri.parse('$urlbase/generaPuestos2.php');

    final bodyData = json
        .encode({'asignacion': asignacion, 'periodo': periodo, 'year': year});
    final response = await http.post(url, body: bodyData);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final dataPuestos = jsonResponse as List<dynamic>;
      final listaPuestos =
          dataPuestos.map((item) => item as Map<String, dynamic>).toList();
      return listaPuestos;
    }
    throw Exception('La solicitud falló o la respuesta no es la esperada');
  }
}
