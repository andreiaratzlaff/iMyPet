import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/models/meusdados_model.dart';

import 'meusdados_bloc.dart';
import 'meusdados_edit_page.dart';

class MeusdadosPage extends StatefulWidget {
  final String title;
  static const String rota = '/meusdados';

  const MeusdadosPage({Key key, this.title = "Meusdados"}) : super(key: key);

  @override
  _MeusdadosPageState createState() => _MeusdadosPageState();
}

class _MeusdadosPageState extends State<MeusdadosPage> {
  var _bloc = MeusdadosBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            var meusdados = Meusdados()
              ..nome = ""
              ..cpf = ""
              ..email = ""
              ..genero = ""
              ..dddCelular = ""
              ..dddTelefone = ""
              ..cep = ""
              ..endereco = ""
              ..estado = ""
              ..cidade = ""
              ..userId = "";

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MeusdadosEditPage(meusdados)),
            );
          },
        ),
        drawer: MenuDrawer(),
        body: Container(
            child: StreamBuilder<List<Meusdados>>(
                stream: _bloc.meusdados,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  return Container(
                    child: ListView(
                      children: snapshot.data.map((meusdados) {
                        return Dismissible(
                            key: Key(meusdados.documentId()),
                            onDismissed: (direction) {
                              _bloc.delete(meusdados.documentId());
                            },
                            child: ListTile(
                              title: Text(meusdados.nome),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MeusdadosEditPage(meusdados)),
                                );
                              },
                            ));
                      }).toList(),
                    ),
                  );
                })));
  }
}
