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
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Codigo Pet"),
                  controller: _codigoPetController,
                  onChanged: _bloc.setCodigoPet,
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Código Empresa"),
                  controller: _codigoEmpresaPetshopController,
                  onChanged: _bloc.setCodigoEmpresaPetshop,
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
                      decoration:
                          InputDecoration(labelText: "Agendar Data Horario"),
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
                  decoration: InputDecoration(labelText: "Selecione Tipo Servico"),
                  controller: _selecioneTipoServicoController,
                  onChanged: _bloc.setSelecioneTipoServico,
                ),
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
                          onChanged: _bloc.setTosa,
                        ),),],);
                },
              ),

              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Informe Tipo Tosa"),
                  controller: _informeTipoTosaController,
                  onChanged: _bloc.setInformeTipoTosa,
                ),
              ),
Container(height: 20),
              StreamBuilder(
                stream: _bloc.outHidratacaoPelo,
                initialData: true,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Hidratacao Pelo",
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      Center(
                        child: Switch(
                          value: snapshot.data,
                          onChanged: _bloc.setHidratacaoPelo,
                        ),),],);
                },
              ),

              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Tipo Hidratacao"),
                  controller: _tipoHidratacaoController,
                  onChanged: _bloc.setTipoHidratacao,
                ),
              ),

              Container(height: 20),
              StreamBuilder(
                stream: _bloc.outAplicarVermifugo,
                initialData: true,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Aplicar Vermifugo",
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      Center(
                        child: Switch(
                          value: snapshot.data,
                          onChanged: _bloc.setAplicarVermifugo,
                        ),),],);
                },
              ),

             Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Tipo Hidratacao"),
                  controller: _tipoVermifugoController,
                  onChanged: _bloc.setTipoVermifugo,
                ),
              ),

            Container(height: 20),
              StreamBuilder(
                stream: _bloc.outAplicarRemedioPulgas,
                initialData: true,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Aplicar Remedio Pulgas",
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      Center(
                        child: Switch(
                          value: snapshot.data,
                          onChanged: _bloc.setAplicarRemedioPulgas,
                        ),),],);
                },
              ),
              
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Tipo Remedio Pulga"),
                  controller: _tipoRemedioPulgaController,
                  onChanged: _bloc.setTipoRemedioPulga,
                ),
              ),

              Container(height: 20),
              StreamBuilder(
                stream: _bloc.outTelebusca,
                initialData: true,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Telebusca",
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      Center(
                        child: Switch(
                          value: snapshot.data,
                          onChanged: _bloc.setTelebusca,
                        ),),],);
                },
              ),

              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Informe local de busca e entrega"),
                  controller: _informeLocalDeBuscaeEntregaController,
                  onChanged: _bloc.setInformeLocalDeBuscaeEntrega,
                ),
              ),
       Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Observacao"),
                  controller: _observacaoController,
                  onChanged: _bloc.setObservacao,
                ),
              ),
//Container(
      //          child: TextField(
        //          decoration: InputDecoration(labelText: "Valor"),
       //           controller: _valorController,
       //           onChanged: _bloc.setValor,
      //          ),
     //     ),

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
Future _selectAgendarDataHorario(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
     // _bloc.setAgendarDataHorario(picked);
    }
  }
