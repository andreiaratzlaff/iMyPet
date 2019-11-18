import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_bloc.dart';
import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_edit_page.dart';
import 'package:iMyPet/models/carteiravacina_model.dart';
import 'package:intl/intl.dart';

class CarteiraVacinaPage extends StatefulWidget {
  final String title;

  static const String rota = '/carteiravacina_list';

  const CarteiraVacinaPage({Key key, this.title = "Carteira Vacina"})
      : super(key: key);

  @override
  _CarteiraVacinaPageState createState() => _CarteiraVacinaPageState();
}

class _CarteiraVacinaPageState extends State<CarteiraVacinaPage> {
  var _bloc = CarteiraVacinaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var carteiraVacina = CarteiraVacina()
            ..validade = DateTime.now()
            ..codigoPet = ""
            ..dataAplicacao = DateTime.now()
            ..dataProximaAplicacao = DateTime.now()
            ..eNecessarioRevacinar = false
            ..fabricante = ""
            ..lembrete = ""
            ..nomePet = ""
            ..observacao = ""
            ..peso = 0
            ..vacina = ""
            ..vacinaId = ""
            ..vermifugoId = ""
            ..vermifugos = "";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarteiraVacinaEditPage(carteiraVacina),
            ),
          );
        },
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: StreamBuilder<List<CarteiraVacina>>(
          stream: _bloc.carteiraVacina,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((carteiraVacina) {
                  return Dismissible(
                    key: Key(carteiraVacina.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(carteiraVacina.documentId());
                    },
                    child: ListTile(
                      title: Text(carteiraVacina.nomePet),
                      subtitle: Text(carteiraVacina.codigoPet),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CarteiraVacinaEditPage(carteiraVacina),
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
