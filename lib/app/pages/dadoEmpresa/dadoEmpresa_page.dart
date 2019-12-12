import 'package:flutter/material.dart';
import 'package:iMyPet/app/menu/drawer.dart';
import 'package:iMyPet/app/pages/dadoEmpresa/dadoEmpresa_bloc.dart';
import 'package:iMyPet/app/pages/dadoEmpresa/dadoEmpresa_edit_page.dart';
import 'package:iMyPet/models/dadoEmpresa_model.dart';

class DadoEmpresaPage extends StatefulWidget {
  final String title;

  static const String rota = '/dadoEmpresa_list';

  const DadoEmpresaPage({Key key, this.title = "Dado Empresa"}) : super(key: key);

  @override
  _DadoEmpresaPageState createState() => _DadoEmpresaPageState();
}

class _DadoEmpresaPageState extends State<DadoEmpresaPage> {
  var _bloc = DadoEmpresaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var dadoEmpresa = DadoEmpresa()
            ..razaoSocial = ""
            ..nome = ""
            ..paginaFacebookInstagram = ""
            ..email = ""
            ..dddCelular = ""
            ..dddTelefone = ""
            ..cep = ""
            ..endereco = ""
            ..cidade = ""
            ..estado = ""
            ..especialidadeId = "";


           

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DadoEmpresaEditPage(dadoEmpresa),
            ),
          );
        },
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: StreamBuilder<List<DadoEmpresa>>(
          stream: _bloc.dadoEmpresa,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((dadoEmpresa) {
                  return Dismissible(
                    key: Key(dadoEmpresa.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(dadoEmpresa.documentId());
                    },
                    child: ListTile(
                      title: Text(dadoEmpresa.razaoSocial),
                      subtitle: Text(dadoEmpresa.nome),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DadoEmpresaEditPage(dadoEmpresa),
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