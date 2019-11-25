import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_bloc.dart';
import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_edit_page.dart';
import 'package:iMyPet/models/banhoETosa_model.dart';

class BanhoETosaPage extends StatefulWidget {
  final String title;

  static const String rota = '/banhoETosa_list';

  const BanhoETosaPage({Key key, this.title = "Banho & Tosa"})
      : super(key: key);

  @override
  _BanhoETosaPageState createState() => _BanhoETosaPageState();
}

class _BanhoETosaPageState extends State<BanhoETosaPage> {
  var _bloc = BanhoETosaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var banhoETosa = BanhoETosa()
            ..codigoPet = ""
            ..codigoEmpresaPetshop = ""
            ..agendarDataHorario = DateTime.now()
            ..selecioneTipoServico = ""
            ..tosa = false
            ..informeTipoTosa = ""
            ..hidratacaoPelo = false
            ..tipoHidratacao = ""
            ..aplicarVermifugo = false
            ..tipoVermifugo = ""
            ..aplicarRemedioPulgas = false
            ..tipoRemedioPulga = ""
             ..telebusca = false
..informeLocalDeBuscaeEntrega = ""
..observacao =""
..valor = 0;
      

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BanhoETosaEditPage(banhoETosa),
            ),
          );
        },
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: StreamBuilder<List<BanhoETosa>>(
          stream: _bloc.banhoETosa,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((banhoETosa) {
                  return Dismissible(
                    key: Key(banhoETosa.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(banhoETosa.documentId());
                    },
                    child: ListTile(
                      title: Text(banhoETosa.codigoEmpresaPetshop),
                      subtitle: Text(banhoETosa.codigoPet),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BanhoETosaEditPage(banhoETosa),
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
