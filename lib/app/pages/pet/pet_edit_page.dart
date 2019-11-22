import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/pet/pet_bloc.dart';
import 'package:iMyPet/models/pet_model.dart';

class PetEditPage extends StatefulWidget {
  PetEditPage(this.pet);

  final Pet pet;

  @override
  _PetEditPageState createState() => _PetEditPageState();
}

class _PetEditPageState extends State<PetEditPage> {
  final _bloc = PetBloc();
 //final _blocPet = PetBloc();
 Pet _pet = new Pet();
 //final _dateFormat = DateFormat("dd/MM/yyyy");
  TextEditingController _codigoPetController;
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

                  
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Sexo"),
                      controller: _sexoController,
                      onChanged: _bloc.setSexo,
                    ),
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Pelagem"),
                      controller: _pelagemController,
                      onChanged: _bloc.setPelagem,
                    ),
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
}
