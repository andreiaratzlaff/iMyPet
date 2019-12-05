import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_bloc.dart';
import 'package:iMyPet/app/pages/vacinas/vacinas_bloc.dart';
import 'package:iMyPet/models/carteiravacina_model.dart';
import 'package:iMyPet/models/vacinas_model.dart';
import 'package:intl/intl.dart';

class CarteiraVacinaEditPage extends StatefulWidget {
  CarteiraVacinaEditPage(this.carteiraVacina);

  final CarteiraVacina carteiraVacina;

  @override
  _CarteiraVacinaEditPageState createState() => _CarteiraVacinaEditPageState();
}

class _CarteiraVacinaEditPageState extends State<CarteiraVacinaEditPage> {
  final _bloc = CarteiraVacinaBloc();
  final _blocVacinas = VacinasBloc();
  Vacinas _vacinas = new Vacinas();
  final _dateFormat = DateFormat("dd/MM/yyyy");

  TextEditingController _codigoPetController;
  TextEditingController _fabricanteController;
  TextEditingController _lembreteController;
  TextEditingController _nomePetController;
  TextEditingController _observacaoController;
  TextEditingController _vacinaController;
  TextEditingController _vacinaIdController;
  TextEditingController _vermifugoIdController;
  TextEditingController _vermifugosController;
  
  @override
  void initState() {
    _bloc.setCarteiraVacina(widget.carteiraVacina);

    _codigoPetController = TextEditingController(text: widget.carteiraVacina.codigoPet);
    _fabricanteController = TextEditingController(text: widget.carteiraVacina.fabricante);
    _lembreteController = TextEditingController(text: widget.carteiraVacina.lembrete);
    _nomePetController = TextEditingController(text: widget.carteiraVacina.nomePet);
    _observacaoController = TextEditingController(text: widget.carteiraVacina.observacao);
    _vacinaController = TextEditingController(text: widget.carteiraVacina.vacina);
    _vacinaIdController = TextEditingController(text: widget.carteiraVacina.vacinaId);
    _vermifugoIdController = TextEditingController(text: widget.carteiraVacina.vermifugoId);
    _vermifugosController = TextEditingController(text: widget.carteiraVacina.vermifugos);

    super.initState();
  }

  @override
  void dispose() {
    _codigoPetController.dispose();
    _fabricanteController.dispose();
    _lembreteController.dispose();
    _nomePetController.dispose();
    _observacaoController.dispose();
    _vacinaController.dispose();
    _vacinaIdController.dispose();
    _vermifugoIdController.dispose();
    _vermifugosController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carteira de Vacina"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
 Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Código Pet"),
                  controller: _codigoPetController,
                  onChanged: _bloc.setCodigoPet,
                ),
              ),
Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome Pet"),
                  controller: _nomePetController,
                  onChanged: _bloc.setNomePet,
                ),
              ),
Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Vacina"),
                  controller: _vacinaController,
                  onChanged: _bloc.setVacina,
                ),
              ),
              Container(height: 20),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Vacina",
                  ),
                  child: StreamBuilder<List<Vacinas>>(
                    stream: _blocVacinas.vacinas,
                    builder: (context, snapshotVacinas) {
                      return snapshotVacinas.hasData
                          ? DropdownButton<Vacinas>(
                              value: _bloc.outVacinaId == null
                                  ? snapshotVacinas.data.first
                                  : getVacina(_bloc.outVacinaId),
                              isExpanded: true,
                              items: snapshotVacinas.data
                                  .map<DropdownMenuItem<Vacinas>>(
                                      (Vacinas vacinas) {
                                return DropdownMenuItem<Vacinas>(
                                  value: vacinas,
                                  child: Text(vacinas.nome),
                                );
                              }).toList(),
                              onChanged: (Vacinas vacinas) {
                                _bloc.setVacinaId(vacinas.documentId());
                              },
                            )
                          : CircularProgressIndicator();
                    },
                  ),
                ),
              ),

              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outValidade,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return InkWell(
                    onTap: () => _selectValidade(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Validade"),
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
             
              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outDataAplicacao,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selectDataAplicacao(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Data Aplicação"),
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
              StreamBuilder<DateTime>(
                stream: _bloc.outDataProximaAplicacao,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selectDataProximaAplicacao(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Data Próxima Aplicação"),
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
              Container(height: 20),
              StreamBuilder(
                stream: _bloc.outENecessarioRevacinar,
                initialData: true,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Necessário Revacinar",
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      Center(
                        child: Switch(
                          value: snapshot.data,
                          onChanged: _bloc.setENecessarioRevacinar,
                        ),),],);
                },
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Fabricante"),
                  controller: _fabricanteController,
                  onChanged: _bloc.setFabricante,
                ),
              ),

              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Vermifugo Id"),
                  controller: _vermifugoIdController,
                  onChanged: _bloc.setVermifugoId,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Vermifugos"),
                  controller: _vermifugosController,
                  onChanged: _bloc.setVermifugos,
                ),
              ),
              //  int _peso;
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Lembrete"),
                  controller: _lembreteController,
                  onChanged: _bloc.setLembrete,
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

  getVacina(Stream<String> outVacinaId){
    _blocVacinas.getVacinas(outVacinaId.toString());

  }

  Future _selectValidade(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      _bloc.setValidade(picked);
    }
  }

  Future _selectDataAplicacao(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      _bloc.setDataAplicacao(picked);
    }
  }

  Future _selectDataProximaAplicacao(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      _bloc.setDataProximaAplicacao(picked);
    }
  }

}
