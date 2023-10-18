import 'package:academicoie/estudiante_provider.dart';
import 'package:academicoie/modelo_puestos.dart';
import 'package:academicoie/puestos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:academicoie/widgets/puestos_detallado.dart';

class Puestos extends StatefulWidget {
  final String periodo;
  final String asignacion;
  const Puestos({Key? key, required this.periodo, required this.asignacion})
      : super(key: key);

  @override
  /* _PuestosState createState() => _PuestosState(); */
  State<Puestos> createState() => _PuestosState();
}

class _PuestosState extends State<Puestos> {
  late EstudianteProvider estudianteProvider;
  late PuestosProvider puestosProvider;
  List<ModeloPuestos> puestos = [];
  String puestoEnLaSede = "";
  String puestoEnElGrupo = "";
  String nombres = "";

  Future<bool> iniciar() async {
    puestosProvider = Provider.of<PuestosProvider>(context, listen: false);
    estudianteProvider =
        Provider.of<EstudianteProvider>(context, listen: false);
    puestos = [];
    if (mounted) {
      super.setState(
        () {},
      );
    }
    await puestosProvider.updateData(
        widget.asignacion, widget.periodo, (DateTime.now()).year.toString());
    puestos = puestosProvider.data;
    nombres = estudianteProvider.nombres;
    int index = 1;
    for (var puesto in puestos) {
      if (puesto.estudiante == estudianteProvider.estudiante) {
        puestoEnLaSede = index.toString();
        setState(() {});
        break;
      }
      index++;
    }
    index = 1;
    List<ModeloPuestos> puestosGrupo = puestos
        .where((puesto) => puesto.grupo == estudianteProvider.grado)
        .toList();
    for (var puestog in puestosGrupo) {
      if (puestog.estudiante == estudianteProvider.estudiante) {
        puestoEnElGrupo = index.toString();
        setState(() {});
        break;
      }
      index++;
    }
    if (mounted) {
      super.setState(
        () {},
      );
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: puestos.isNotEmpty
          ? SizedBox(
              child: ListaPuestos(
                puestos: puestos,
                puesto: puestoEnLaSede,
                grupo: estudianteProvider.grado,
                puestoGrupo: puestoEnElGrupo,
              ),
            )
          : const SpinKitCubeGrid(
              color: Colors.blue, // Color de la animación
              size: 46.0,
            ),
    );
  }
}
