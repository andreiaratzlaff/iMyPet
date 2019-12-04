import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/pet/pet_bloc.dart';
import 'package:iMyPet/models/pet_model.dart';
import 'package:intl/intl.dart';

class PetEditPage extends StatefulWidget {
  PetEditPage(this.pet);

  final Pet pet;

  @override
  _PetEditPageState createState() => _PetEditPageState();
}

class _PetEditPageState extends State<PetEditPage> {
  final _bloc = PetBloc();
  //final _blocPet = PetBloc();
  final _dateFormat = DateFormat("dd/MM/yyyy");
  TextEditingController _especieController;
  TextEditingController _nomeController;
  TextEditingController _corController;
  TextEditingController _pesoController;
  TextEditingController _sexoController;
  TextEditingController _pelagemController;
  TextEditingController _castradoController;
  TextEditingController _observacaoController;

  @override
  void initState() {
    _bloc.setPet(widget.pet);

    // _codigoPetController = TextEditingController(text: widget.pet.codigoPet);
    //_cogigoPetController = TextEditingController(text: widget.pet.especie);
    _especieController = TextEditingController(text: widget.pet.especie);
    _nomeController = TextEditingController(text: widget.pet.nome);
    _corController = TextEditingController(text: widget.pet.cor);
    _sexoController = TextEditingController(text: widget.pet.sexo);
    _pelagemController = TextEditingController(text: widget.pet.pelagem);
    _castradoController = TextEditingController(text: widget.pet.castrado);
    _observacaoController = TextEditingController(text: widget.pet.observacao);

    super.initState();
  }

  @override
  void dispose() {
    //  _codigoPetController.dispose();
    _especieController.dispose();
    _nomeController.dispose();
    _corController.dispose();
    _pesoController.dispose();
    _sexoController.dispose();
    _pelagemController.dispose();
    _castradoController.dispose();
    _observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Especie"),
                  controller: _especieController,
                  onChanged: _bloc.setEspecie,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Cor"),
                  controller: _corController,
                  onChanged: _bloc.setCor,
                ),
              ),
              Container(height: 20),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Sexo",
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Masculino'),
                        leading: Radio(
                          value: 'M',
                          groupValue: _bloc.outSexoValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setSexo(value);
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Femino'),
                        leading: Radio(
                          value: 'F',
                          groupValue: _bloc.outSexoValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setSexo(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Pelagem"),
                  controller: _pelagemController,
                  onChanged: _bloc.setPelagem,
                ),
              ),
              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outDataNascimento,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selectDataNascimento(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Data de Nascimento"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(_dateFormat.format(snapshot.data)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Observação"),
                  controller: _observacaoController,
                  onChanged: _bloc.setObservacao,
                ),
              ),
              RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (_bloc.insertOrUpdate()) {
                      Navigator.pop(context);
                    }
                  }),
              RaisedButton(
                  child: Text("Editar"),
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

  Future _selectDataNascimento(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      _bloc.setDataNascimento(picked);
    }
  }
}
