import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/especie/especie_bloc.dart';
import 'package:iMyPet/models/especie_model.dart';

class EspecieEditPage extends StatefulWidget {
  EspecieEditPage(this.especie);

  final Especie especie;

  @override
  _EspecieEditPageState createState() => _EspecieEditPageState();
}

class _EspecieEditPageState extends State<EspecieEditPage> {
  TextEditingController _nomeController;
  final _bloc = EspecieBloc();

  @override
  void initState() {
    _bloc.setEspecie(widget.especie);
    _nomeController = TextEditingController(text: widget.especie.nome);
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
        title: Text("Especie"),
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
