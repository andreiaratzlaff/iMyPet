import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/models/raca_model.dart';

import 'raca_bloc.dart';
import 'raca_edit_page.dart';

class RacaPage extends StatefulWidget {
  final String title;
  static const String rota = '/raca';

  const RacaPage({Key key, this.title = "Raca"}) : super(key: key);

  @override
  _RacaPageState createState() => _RacaPageState();
}

class _RacaPageState extends State<RacaPage> {
  var _bloc = RacaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            var raca = Raca()..nomeRaca = "";

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RacaEditPage(raca)),
            );
          },
        ),
        drawer: MenuDrawer(),
        body: Container(
            child: StreamBuilder<List<Raca>>(
                stream: _bloc.raca,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  return Container(
                    child: ListView(
                      children: snapshot.data.map((raca) {
                        return Dismissible(
                            key: Key(raca.documentId()),
                            onDismissed: (direction) {
                              _bloc.delete(raca.documentId());
                            },
                            child: ListTile(
                              title: Text(raca.nomeRaca),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RacaEditPage(raca)),
                                );
                              },
                            ));
                      }).toList(),
                    ),
                  );
                })));
  }
}
