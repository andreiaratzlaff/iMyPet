import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/models/especie_model.dart';

import 'especie_bloc.dart';
import 'especie_edit_page.dart';

class EspeciePage extends StatefulWidget {
  final String title;
  static const String rota = '/especie';

  const EspeciePage({Key key, this.title = "Especie"}) : super(key: key);

  @override
  _EspeciePageState createState() => _EspeciePageState();
}

class _EspeciePageState extends State<EspeciePage> {
  var _bloc = EspecieBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            var especie = Especie()..nome = "";

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EspecieEditPage(especie)),
            );
          },
        ),
        drawer: MenuDrawer(),
        body: Container(
            child: StreamBuilder<List<Especie>>(
                stream: _bloc.especie,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  return Container(
                    child: ListView(
                      children: snapshot.data.map((especie) {
                        return Dismissible(
                            key: Key(especie.documentId()),
                            onDismissed: (direction) {
                              _bloc.delete(especie.documentId());
                            },
                            child: ListTile(
                              title: Text(especie.nome),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EspecieEditPage(especie)),
                                );
                              },
                            ));
                      }).toList(),
                    ),
                  );
                })));
  }
}
