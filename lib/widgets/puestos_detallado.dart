import 'package:academicoie2/modelo_puestos.dart';
import 'package:academicoie2/widgets/los.dart';
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
  Color botonColor = Colors.green;
  Color titleColor = Colors.lightBlueAccent;
  String textoBoton = "Ver el grupo";
  bool filtrado = false;
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                      Row(
                        children: [
                          Text(widget.puestoGrupo,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          } else if (index == 1) {
            // Este es el segundo elemento, muestra el segundo widget especial
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        /* print('...');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Los(
                                    stilo: TextStyle(color: Colors.blue))));

                        return; */
                        if (textoBoton == 'Ver el grupo') {
                          textoBoton = ' Ver la sede ';
                          botonColor = Colors.blueGrey;
                          titleColor = Colors.purpleAccent;
                          filtrado = !filtrado;
                          puestosFiltrados = widget.puestos
                              .where(
                                (puesto) => puesto.grupo == widget.grupo,
                              )
                              .toList();
                        } else {
                          textoBoton = 'Ver el grupo';
                          puestosFiltrados = widget.puestos;
                          botonColor = Colors.green;
                          titleColor = Colors.lightBlueAccent;
                          filtrado = !filtrado;
                        }
                        setState(() {});
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: botonColor),
                      child: Text(textoBoton)),
                )
              ],
            );
          } else {
            tileColor = Colors.white;
            if (!filtrado) {
              if ((index - 1).toString() == widget.puesto) {
                tileColor = Colors.yellow;
              }
            } else {
              if ((index - 1).toString() == widget.puestoGrupo) {
                tileColor = Colors.yellow;
              }
            }
            return ListTile(
              tileColor: tileColor,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text((index - 1).toString(),
                    style: TextStyle(fontSize: 26, color: titleColor)),
              ),
              title: Text(puestosFiltrados[index - 2].nombres,
                  style: TextStyle(color: titleColor)),
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
