import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/raca/raca_bloc.dart';
import 'package:iMyPet/models/raca_model.dart';

class RacaEditPage extends StatefulWidget {
  RacaEditPage(this.raca);

  final Raca raca;

  @override
  _RacaEditPageState createState() => _RacaEditPageState();
}

class _RacaEditPageState extends State<RacaEditPage> {
  TextEditingController _nomeRacaController;
  final _bloc = RacaBloc();

  @override
  void initState() {
    _bloc.setRaca(widget.raca);
    _nomeRacaController = TextEditingController(text: widget.raca.nomeRaca);
    super.initState();
  }

  @override
  void dispose() {
    _nomeRacaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raca"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Raca"),
                  controller: _nomeRacaController,
                  onChanged: _bloc.setNomeRaca,
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
