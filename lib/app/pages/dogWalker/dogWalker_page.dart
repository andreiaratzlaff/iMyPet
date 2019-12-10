import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/app/pages/dogWalker/dogWalker_bloc.dart';
import 'package:iMyPet/app/pages/dogWalker/dogWalker_edit_page.dart';
import 'package:iMyPet/models/dogWalker_model.dart';

class DogWalkerPage extends StatefulWidget {
  final String title;

  static const String rota = '/dogWalker_list';

  const DogWalkerPage({Key key, this.title = "Dog Walker"}) : super(key: key);

  @override
  _DogWalkerPageState createState() => _DogWalkerPageState();
}

class _DogWalkerPageState extends State<DogWalkerPage> {
  var _bloc = DogWalkerBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var dogWalker = DogWalker()
            //..petID = ""
           // ..vacinacaoEmDia = ""
            //..possuiAlgumaRestricao = ""
            ..informeARestricao = ""
            ..dataEHorarioInicioPasseio = DateTime.now() 
            ..dataEHorarioFimPasseio = DateTime.now() 
            ..informeLocalTelebusca = ""
            ..observacao = ""
            ..empresaId = ""
            ..observacao = "";

          

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DogWalkerEditPage(dogWalker),
            ),
          );
        },
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: StreamBuilder<List<DogWalker>>(
          stream: _bloc.dogWalker,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((dogWalker) {
                  return Dismissible(
                    key: Key(dogWalker.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(dogWalker.documentId());
                    },
                    child: ListTile(
                     // title: Text(dogWalker.petID),
                      subtitle: Text(dogWalker.empresaId),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DogWalkerEditPage(dogWalker),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}