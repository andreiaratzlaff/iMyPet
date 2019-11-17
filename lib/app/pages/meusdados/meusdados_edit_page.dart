// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/meusdados/meusdados_bloc.dart';
import 'package:iMyPet/models/meusdados_model.dart';

class MeusdadosEditPage extends StatefulWidget {
  MeusdadosEditPage(this.meusdados);

  final Meusdados meusdados;

  @override
  _MeusdadosEditPageState createState() => _MeusdadosEditPageState();
}

class _MeusdadosEditPageState extends State<MeusdadosEditPage> {
  TextEditingController _nomeController;

  final _bloc = MeusdadosBloc();

  @override
  void initState() {
    _bloc.setMeusdados(widget.meusdados);
    _nomeController = TextEditingController(text: widget.meusdados.nome);
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iMyPet"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              
              RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (_bloc.insertOrUpdate()) {
                      Navigator.pop(context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
