import 'package:academicoie/modelo_puestos.dart';
import 'package:flutter/material.dart';

class ListaPuestos extends StatefulWidget {
  final List<ModeloPuestos> puestos;
  final String puesto;
  final String grupo;
  final String puestoGrupo;
  const ListaPuestos({
    super.key,
    required this.puestos,
    required this.puesto,
    required this.grupo,
    required this.puestoGrupo,
  });

  @override
  State<ListaPuestos> createState() => _ListaPuestosState();
}

class _ListaPuestosState extends State<ListaPuestos> {
  final ScrollController _controller = ScrollController();
  late List<ModeloPuestos> puestosFiltrados;
  Color tileColor = Colors.white;
  String textoBoton = "Ver el grupo";
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {});
      } else {
        // El ListView.builder aún no ha terminado
      }
    });
    puestosFiltrados = widget.puestos;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _controller,
        itemCount: puestosFiltrados.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Este es el primer elemento, muestra el primer widget especial
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Puestos'),
                Row(
                  children: [
                    const Text(
                      'Puesto en la sede:',
                    ),
                    const SizedBox(width: 10),
                    Text(widget.puesto,
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Puesto en el grupo:',
                    ),
                    const SizedBox(width: 10),
                    Text(widget.puestoGrupo,
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            );
          } else if (index == 1) {
            // Este es el segundo elemento, muestra el segundo widget especial
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (textoBoton == 'Ver el grupo') {
                          textoBoton = 'Ver la sede';
                          puestosFiltrados = widget.puestos
                              .where(
                                (puesto) => puesto.grupo == widget.grupo,
                              )
                              .toList();
                        } else {
                          textoBoton = 'Ver el grupo';
                          puestosFiltrados = widget.puestos;
                        }
                        setState(() {});
                      },
                      child: Text(textoBoton)),
                )
              ],
            );
          } else {
            tileColor = Colors.white;
            if ((index - 1).toString() == widget.puesto) {
              tileColor = Colors.yellow;
            }
            return ListTile(
              tileColor: tileColor,
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text((index - 1).toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.cyan)),
              ),
              title: Text(puestosFiltrados[index - 2].nombres,
                  style: const TextStyle(color: Colors.lightBlueAccent)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Promedio: ${puestosFiltrados[index - 2].promedio}'),
                  Text('Grupo: ${puestosFiltrados[index - 2].grupo}'),
                  const Divider()
                ],
              ),
            );
          }
        });
  }
}
