import 'package:flutter/material.dart';
//import 'package:iMyPet/app/pages/especie/especie_bloc.dart';
import 'package:iMyPet/app/pages/dogWalker/dogWalker_bloc.dart';
import 'package:iMyPet/app/pages/dogWalker/dogWalker_bloc.dart';
import 'package:iMyPet/models/dogWalker_model.dart';
import 'package:iMyPet/models/dogWalker_model.dart';
import 'package:iMyPet/models/dogWalker_model.dart';
import 'package:iMyPet/models/pet_model.dart';
import 'package:intl/intl.dart';

class DogWalkerEditPage extends StatefulWidget {
  DogWalkerEditPage(this.dogWalker);

  final DogWalker dogWalker;

  @override
  _DogWalkerEditPageState createState() => _DogWalkerEditPageState();
}

class _DogWalkerEditPageState extends State<DogWalkerEditPage> {
  final _bloc = DogWalkerBloc();
  final _blocDogWalker = DogWalkerBloc();
 // final _blocRaca = RacaBloc();

  final _dateFormat = DateFormat("dd/MM/yyyy");

  TextEditingController _informeLocalTelebuscaController;
  TextEditingController _vacinacaoEmDiaController;
  TextEditingController _possuiAlgumaRestricaoController;
  TextEditingController _informeARestricaoController;
  TextEditingController _telebuscaController;
  TextEditingController _empresaIdController;
  TextEditingController _observacaoController;

    
  @override
  void initState() {
    _bloc.setDogWalker(widget.dogWalker);

    _informeLocalTelebuscaController = TextEditingController(text: widget.dogWalker.informeLocalTelebusca);
    _informeARestricaoController = TextEditingController(text: widget.dogWalker.informeARestricao);
    _observacaoController = TextEditingController(text: widget.dogWalker.observacao);

    super.initState();
  }

  @override
  void dispose() {
    //  _codigoPetController.dispose();
    _informeLocalTelebuscaController.dispose();
    _informeARestricaoController.dispose();
    _observacaoController.dispose();
    super.dispose();

      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Walker"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Pet",
                  ),
                  child: StreamBuilder<List<Pet>>(
                  //  stream: _blocPet.pet,
                    builder: (context, snapshotPet) {
                      var _petId = _bloc.outPetIdValue;

                      return snapshotPet.hasData
                          ? DropdownButton<String>(
                              value: _petId == null || _petId == ""?
                                    snapshotPet.data.first.documentId():
                                    _petId,
                              isExpanded: true,
                              items: snapshotPet.data
                                  .map<DropdownMenuItem<String>>(
                                      (Pet pet) {
                                return DropdownMenuItem<String>(
                                  value: pet.documentId(),
                                  child: Text(pet.nome),
                                );
                              }).toList(),
                              onChanged: (String petId) {
                                setState(() {
                                  _petId = petId;
                                  _bloc.setPetId(petId);
                                }
                                );
                              },
                            )
                          : CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Empresa"),
                  controller: _empresaIdController,
                  onChanged: _bloc.setEmpresaId,
                ),
              ),

              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outDataEHorarioInicioPasseio,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selectDataEHorarioInicioPasseio(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Data e horario inicio passeio"),
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
                  decoration: InputDecoration(labelText: "Informe Local Tele busca"),
                  controller: _informeLocalTelebuscaController,
                  onChanged: _bloc.setInformeLocalTelebusca,
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
              
            ],
          ),
        ),
      ),
    );
  }


  
  Future _selectDataEHorarioInicioPasseio(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      _bloc.setDataEHorarioInicioPasseio(picked);
    }
  }
}




