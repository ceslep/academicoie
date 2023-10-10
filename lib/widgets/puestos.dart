import 'package:academicoie/estudiante_provider.dart';
import 'package:academicoie/modelo_puestos.dart';
import 'package:academicoie/puestos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Puestos extends StatefulWidget {
  const Puestos({Key? key}) : super(key: key);

  @override
  /* _PuestosState createState() => _PuestosState(); */
  State<Puestos> createState() => _PuestosState();
}

class _PuestosState extends State<Puestos> {
  late EstudianteProvider estudianteProvider;
  late PuestosProvider puestosProvider;
  List<ModeloPuestos> puestos = [];
  @override
  void initState() {
    super.initState();
    puestosProvider = Provider.of<PuestosProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return const Text('Puestos');
  }
}
