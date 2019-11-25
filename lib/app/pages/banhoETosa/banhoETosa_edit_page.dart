import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_bloc.dart';
import 'package:iMyPet/models/banhoETosa_model.dart';
import 'package:intl/intl.dart';

class BanhoETosaEditPage extends StatefulWidget {
  BanhoETosaEditPage(this.banhoETosa);

  final BanhoETosa banhoETosa;

  @override
  _BanhoETosaEditPageState createState() => _BanhoETosaEditPageState();
}

class _BanhoETosaEditPageState extends State<BanhoETosaEditPage> {
  final _bloc = BanhoETosaBloc();
  final _blocBanhoETosa = BanhoETosaBloc();
  BanhoETosa _banhoETosa = new BanhoETosa();
  final _dateFormat = DateFormat("dd/MM/yyyy");

  TextEditingController _codigoPetController;
  TextEditingController _codigoEmpresaPetshopController;
  TextEditingController _agendarDataHorarioController;
  TextEditingController _selecioneTipoServicoController;
  TextEditingController _tosaController;
  TextEditingController _informeTipoTosaController;
  TextEditingController _hidratacaoPeloController;
  TextEditingController _tipoHidratacaoController;
  TextEditingController _aplicarVermifugoController;
  TextEditingController _tipoVermifugoController;
  TextEditingController _aplicarRemedioPulgasController;
  TextEditingController _tipoRemedioPulgaController;
  TextEditingController _informeLocalDeBuscaeEntregaController;
  TextEditingController _observacaoController;
  TextEditingController _valorController;

  @override
  void initState() {
    _bloc.setBanhoETosa(widget.banhoETosa);

    _codigoPetController =
        TextEditingController(text: widget.banhoETosa.codigoPet);
    _codigoEmpresaPetshopController =
        TextEditingController(text: widget.banhoETosa.codigoEmpresaPetshop);

    _selecioneTipoServicoController =
        TextEditingController(text: widget.banhoETosa.selecioneTipoServico);

       _informeTipoTosaController =
        TextEditingController(text: widget.banhoETosa.informeTipoTosa);

    _tipoHidratacaoController =
        TextEditingController(text: widget.banhoETosa.tipoHidratacao);

    _tipoRemedioPulgaController =
        TextEditingController(text: widget.banhoETosa.tipoRemedioPulga);

    _observacaoController =
        TextEditingController(text: widget.banhoETosa.observacao);

    //_valorController =
    //    TextEditingController(text: widget.banhoETosa.valor);

    super.initState();
  }

  @override
  void dispose() {
    _codigoPetController.dispose();
    _codigoEmpresaPetshopController.dispose();
    _agendarDataHorarioController.dispose();
    _selecioneTipoServicoController.dispose();
    _tosaController.dispose();
    _informeTipoTosaController.dispose();
    _hidratacaoPeloController.dispose();
    _tipoHidratacaoController.dispose();
    _aplicarVermifugoController.dispose();
    _tipoVermifugoController.dispose();
    _aplicarRemedioPulgasController.dispose();
    _tipoRemedioPulgaController.dispose();
    _informeLocalDeBuscaeEntregaController.dispose();
    _observacaoController.dispose();
    _valorController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banho & Tosa"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outCodigoEmpresaPetshop,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selecCodigoEmpresaPetshop(context, snapshot.data),
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "Codigo Empresa Petshop"),
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
                  decoration: InputDecoration(labelText: "Código Pet"),
                  controller: _codigoPetController,
                  onChanged: _bloc.setCodigoPet,
                ),
              ),
              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outAgendarDataHorario,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selectAgendarDataHorario(context, snapshot.data),
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "Agendar Data e Horario"),
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
                stream: _bloc.outSelecioneTipoServico,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () =>
                        _selectSelecioneTipoServico(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Selecione Tipo Servico"),
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
                stream: _bloc.outTosa,
                initialData: true,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Tosa",
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      Center(
                        child: Switch(
                          value: snapshot.data,
                          onChanged: _bloc.setENecessarioRevacinar,
                        ),
                      ),
                    ],
                  );
                },
              ),


              _Controller.dispose();
    _informeTipoTosaController.dispose();
    _hidratacaoPeloController.dispose();
    _tipoHidratacaoController.dispose();
    _aplicarVermifugoController.dispose();
    _tipoVermifugoController.dispose();
    _aplicarRemedioPulgasController.dispose();
    _tipoRemedioPulgaController.dispose();
    _informeLocalDeBuscaeEntregaController.dispose();
    _observacaoController.dispose();
    _valorController.dispose();
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Fabricante"),
                  controller: _fabricanteController,
                  onChanged: _bloc.setFabricante,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Lembrete"),
                  controller: _lembreteController,
                  onChanged: _bloc.setLembrete,
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
                  decoration: InputDecoration(labelText: "Observação"),
                  controller: _observacaoController,
                  onChanged: _bloc.setObservacao,
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

  getVacina(Stream<String> outVacinaId) {
    _blocVacinas.getVacinas(outVacinaId.toString());
  }

  Future _selectValidade(BuildContext context, DateTime initialDate) async {
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
