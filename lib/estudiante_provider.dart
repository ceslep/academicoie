import 'package:flutter/material.dart';

class EstudianteProvider extends ChangeNotifier {
  String _estudiante = "";
  String _nombresEstudiante = "";
  String _periodo = "";
  String _grado = "";
  String _asignacion = "";
  get estudiante => _estudiante;
  get nombres => _nombresEstudiante;
  get periodo => _periodo;
  get grado => _grado;
  get asignacion => _asignacion;
  void setEstudiante(String estudiante) {
    _estudiante = estudiante;
    notifyListeners();
  }

  void setGrado(String grado) {
    _grado = grado;
    notifyListeners();
  }

  void setAsignacion(String asignacion) {
    _asignacion = asignacion;
    notifyListeners();
  }

  void setNombresEstudiante(String nombresEstudiante) {
    _nombresEstudiante = nombresEstudiante;
    notifyListeners();
  }

  void setPeriodo(String periodo) {
    _periodo = periodo;
    notifyListeners();
  }

  // Otros métodos para modificar la lista de tareas
}
